#!/usr/bin/env bash

# update_dotfiles.sh
# Copia las configs actuales al repo de dotfiles

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -A CONFIGS=(
  ["$HOME/.config/nvim"]="$DOTFILES_DIR/nvim"
  ["$HOME/.config/zellij"]="$DOTFILES_DIR/zellij"
  ["$HOME/.config/alacritty"]="$DOTFILES_DIR/alacritty"  # si existe
  ["$HOME/.config/ghostty"]="$DOTFILES_DIR/ghostty"  # si existe
  ["$HOME/.config/starship.toml"]="$DOTFILES_DIR/starship/starship.toml"
  ["$HOME/.zshrc"]="$DOTFILES_DIR/zsh/.zshrc"
  ["$HOME/.zsh_aliases"]="$DOTFILES_DIR/zsh/.zsh_aliases"  # si existe
)

echo "==> Actualizando dotfiles..."

for SRC in "${!CONFIGS[@]}"; do
  DEST="${CONFIGS[$SRC]}"

  if [ ! -e "$SRC" ]; then
    echo "  [skip] No existe: $SRC"
    continue
  fi

  if [ -d "$SRC" ]; then
    mkdir -p "$DEST"
    rsync -a --delete "$SRC/" "$DEST/"
    echo "  [ok] $SRC -> $DEST"
  else
    mkdir -p "$(dirname "$DEST")"
    cp "$SRC" "$DEST"
    echo "  [ok] $SRC -> $DEST"
  fi
done

echo ""
echo "==> Listo. Revisá los cambios con: git -C $DOTFILES_DIR status"
