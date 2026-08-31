#!/bin/bash
# Claude Code subagent status line.
#
# Receives ONE JSON object on stdin containing every visible subagent row:
#   { columns: <int>, tasks: [ { id, name, type, status, description, label,
#                                startTime, model, effort, contextWindowSize,
#                                tokenCount, tokenSamples, cwd }, ... ] }
#
# Emits one JSON line per row we want to override:
#   {"id":"<task id>","content":"<row body>"}
#
# Omitting a task's id keeps Claude's default row. An empty content hides it.
# Styling mirrors status_line.sh so the panel and the bar read as one thing.
#
# Implemented as a single jq program on purpose: this runs on every refresh
# tick, and spawning a subshell per row is exactly the lag the docs warn about.

set -euo pipefail

exec jq -c -r '
  def E: "\u001b[";
  def RESET: E + "0m";
  def DIM:   E + "90m";
  def BOLD:  E + "1m";
  def GREEN: E + "32m";
  def YELLOW:E + "33m";
  def RED:   E + "31m";
  def MAG:   E + "35m";
  def CYAN:  E + "36m";

  # jq returns null for "x" * 0, so guard every repeat.
  def rep($s; $n): if $n <= 0 then "" else ($s * $n) end;

  def statusdot:
    if   . == "running"   or . == "in_progress" or . == "active"  then GREEN  + "●" + RESET
    elif . == "completed" or . == "done"        or . == "success" then DIM    + "✓" + RESET
    elif . == "failed"    or . == "error"                         then RED    + "✗" + RESET
    elif . == "pending"   or . == "queued"                        then YELLOW + "○" + RESET
    else DIM + "·" + RESET end;

  # startTime shape is not guaranteed: accept epoch seconds, epoch millis, or ISO 8601.
  def elapsed:
    if . == null then null
    elif type == "number" then (now - (if . > 100000000000 then . / 1000 else . end))
    else (try (now - fromdateiso8601) catch null) end;

  def fmtdur:
    if . == null or . < 0 then ""
    else (floor) as $s
      | if   $s >= 3600 then "\(($s / 3600) | floor)h\((($s % 3600) / 60) | floor)m"
        elif $s >= 60   then "\(($s / 60) | floor)m\($s % 60)s"
        else "\($s)s" end
    end;

  def bar($pct; $w):
    (($pct * $w / 100) | floor) as $f
    | (if   $pct >= 90 then RED
       elif $pct >= 70 then YELLOW
       else GREEN end) as $col
    | $col + rep("▓"; $f) + DIM + rep("░"; $w - $f) + RESET;

  def shortmodel:
    if . == null then ""
    else (tostring | sub("^claude-"; "") | sub("-[0-9]{8}$"; "")) end;

  (.columns // 80) as $cols
  | (.tasks // [])[]
  | . as $t
  | ($t.tokenCount // 0) as $tok
  | ($t.contextWindowSize // 0) as $cw
  | (if $cw > 0 then (($tok * 100 / $cw) | floor) else null end) as $pct
  | ($t.name // $t.type // "agent") as $name
  # Everything except the label is roughly fixed width; give the label the slack.
  | ([$cols - 46 - ($name | length), 0] | max) as $budget
  | (($t.label // $t.description // "")
     | if length > $budget then (.[0:[$budget - 1, 0] | max] + "…") else . end) as $lbl
  | [ ($t.status // "" | statusdot),
      BOLD + YELLOW + $name + RESET
    ]
    + (if $lbl != "" then [DIM + $lbl + RESET] else [] end)
    + (if $pct != null then ["🧠 " + bar($pct; 6) + " " + CYAN + "\($pct)%" + RESET] else [] end)
    + (if ($t.startTime | elapsed | fmtdur) != "" then ["⏱ " + DIM + ($t.startTime | elapsed | fmtdur) + RESET] else [] end)
    + (if ($t.effort // "") != "" then [MAG + "⚡\($t.effort)" + RESET] else [] end)
    + (if ($t.model // null) != null then [DIM + ($t.model | shortmodel) + RESET] else [] end)
  | {id: $t.id, content: join(" ")}
'
