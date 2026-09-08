#!/usr/bin/env bash
set -euo pipefail

AI_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SHARED_DIR="$AI_DIR/shared"
CLAUDE_DIR="$AI_DIR/claude"
PI_DIR="$AI_DIR/pi"

log() { printf '%s\n' "$*"; }

ensure_dir() {
  mkdir -p "$1"
}

link_file() {
  local src="$1"
  local dst="$2"

  if [[ ! -e "$src" ]]; then
    log "skip missing source: $src"
    return 0
  fi

  ensure_dir "$(dirname -- "$dst")"

  if [[ -L "$dst" ]]; then
    local current
    current="$(readlink -- "$dst")"
    if [[ "$current" == "$src" ]]; then
      log "ok: $dst -> $src"
      return 0
    fi
    rm -- "$dst"
  elif [[ -e "$dst" ]]; then
    log "skip existing non-symlink: $dst"
    return 0
  fi

  ln -s -- "$src" "$dst"
  log "link: $dst -> $src"
}

ensure_real_dir() {
  local dir="$1"

  if [[ -L "$dir" ]]; then
    rm -- "$dir"
  elif [[ -e "$dir" && ! -d "$dir" ]]; then
    log "skip non-directory path: $dir"
    return 1
  fi

  ensure_dir "$dir"
}

link_skill_dir() {
  local dst_root="$1"

  if [[ ! -d "$SHARED_DIR/skills" ]]; then
    log "skip missing skills source: $SHARED_DIR/skills"
    return 0
  fi

  ensure_real_dir "$dst_root"

  local skill src dst
  for src in "$SHARED_DIR"/skills/*; do
    [[ -d "$src" ]] || continue
    [[ -f "$src/SKILL.md" ]] || continue

    skill="$(basename -- "$src")"
    dst="$dst_root/$skill"

    if [[ -L "$dst" ]]; then
      local current
      current="$(readlink -- "$dst")"
      if [[ "$current" == "$src" ]]; then
        log "ok: $dst -> $src"
        continue
      fi
      rm -- "$dst"
    elif [[ -e "$dst" ]]; then
      log "skip existing non-symlink skill: $dst"
      continue
    fi

    ln -s -- "$src" "$dst"
    log "link: $dst -> $src"
  done
}

main() {
  log "AI config source: $AI_DIR"

  # Shared global context.
  link_file "$SHARED_DIR/AGENTS.md" "$HOME/.agents/AGENTS.md"
  link_file "$SHARED_DIR/AGENTS.md" "$HOME/.claude/AGENTS.md"
  link_file "$SHARED_DIR/AGENTS.md" "$HOME/.codex/AGENTS.md"
  link_file "$SHARED_DIR/AGENTS.md" "$HOME/.pi/agent/AGENTS.md"
  link_file "$SHARED_DIR/AGENTS.md" "$HOME/.config/opencode/AGENTS.md"

  # Shared Agent Skills. Per-skill symlinks keep installer-managed skills intact.
  link_skill_dir "$HOME/.agents/skills"
  link_skill_dir "$HOME/.claude/skills"
  link_skill_dir "$HOME/.codex/skills"

  # Claude Code overlay.
  link_file "$CLAUDE_DIR/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

  if [[ -d "$CLAUDE_DIR/agents" ]]; then
    ensure_real_dir "$HOME/.claude/agents"
    for agent in "$CLAUDE_DIR"/agents/*.md; do
      [[ -f "$agent" ]] || continue
      link_file "$agent" "$HOME/.claude/agents/$(basename -- "$agent")"
    done
  fi

  # Pi overlay.
  link_file "$PI_DIR/models.json" "$HOME/.pi/agent/models.json"

  log "done"
}

main "$@"
