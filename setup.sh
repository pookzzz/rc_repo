#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

timestamp="$(date +%Y%m%d_%H%M%S)"
backup_root="$HOME/backup_config"
backup_dir="$backup_root/$timestamp"

mkdir -p "$backup_dir"

backup_if_needed() {
  local target="$1"
  local dest
  local base

  if [ ! -e "$target" ] && [ ! -L "$target" ]; then
    return 0
  fi

  base="$(basename "$target")"
  dest="$backup_dir/$base"

  if [ -L "$target" ]; then
    local resolved
    resolved="$(readlink "$target" || true)"
    if [ "$resolved" = "$2" ]; then
      return 0
    fi
  fi

  mv -f "$target" "$dest"
}

link_file() {
  local source="$1"
  local target="$2"

  backup_if_needed "$target" "$source"
  ln -sfn "$source" "$target"
}

ensure_vim_plug() {
  local plug_path="$HOME/.vim/autoload/plug.vim"
  if [ -f "$plug_path" ]; then
    return 0
  fi
  if ! command -v curl >/dev/null 2>&1; then
    echo "curl not found; skipping vim-plug install"
    return 0
  fi
  mkdir -p "$(dirname "$plug_path")"
  curl -fsSL -o "$plug_path" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

ensure_oh_my_zsh_addons() {
  local omz="$HOME/.oh-my-zsh"
  if [ ! -d "$omz" ]; then
    echo "oh-my-zsh not found at $omz; skipping zsh addon clones"
    return 0
  fi

  mkdir -p "$omz/custom/themes" "$omz/custom/plugins"

  if [ ! -d "$omz/custom/themes/powerlevel9k" ]; then
    git clone https://github.com/bhilburn/powerlevel9k.git "$omz/custom/themes/powerlevel9k"
  fi
  if [ ! -d "$omz/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$omz/custom/plugins/zsh-autosuggestions"
  fi
  if [ ! -d "$omz/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$omz/custom/plugins/zsh-syntax-highlighting"
  fi
}

maybe_set_default_shell() {
  if [ "${1:-}" != "--set-default-shell" ]; then
    return 0
  fi
  if ! command -v zsh >/dev/null 2>&1; then
    echo "zsh not found; cannot set default shell"
    return 0
  fi
  chsh -s "$(command -v zsh)" || true
}

link_file "$repo_root/.vimrc" "$HOME/.vimrc"
link_file "$repo_root/.vimpressrc" "$HOME/.vimpressrc"
link_file "$repo_root/.zshrc" "$HOME/.zshrc"
link_file "$repo_root/.aliases_zsh" "$HOME/.aliases_zsh"
link_file "$repo_root/.tmux.conf" "$HOME/.tmux.conf"

ensure_vim_plug
ensure_oh_my_zsh_addons
maybe_set_default_shell "${1:-}"
