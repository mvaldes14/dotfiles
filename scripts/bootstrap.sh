#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="${BIN_DIR:-$HOME/.local/bin}"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$BIN_DIR"

for src in "$SCRIPT_DIR"/*; do
  [[ -f "$src" && -x "$src" ]] || continue

  name="$(basename "$src")"
  [[ "$name" == "bootstrap.sh" ]] && continue

  dest="$BIN_DIR/$name"

  if [[ -L "$dest" ]]; then
    current="$(readlink "$dest")"
    if [[ "$current" == "$src" ]]; then
      printf 'ok: %s -> %s\n' "$dest" "$src"
      continue
    fi

    printf 'replace: %s -> %s\n' "$dest" "$src"
    ln -sfn "$src" "$dest"
    continue
  fi

  if [[ -e "$dest" ]]; then
    printf 'skip: %s exists and is not symlink\n' "$dest" >&2
    continue
  fi

  printf 'link: %s -> %s\n' "$dest" "$src"
  ln -s "$src" "$dest"
done

case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *) printf 'warn: %s not in PATH\n' "$BIN_DIR" >&2 ;;
esac
