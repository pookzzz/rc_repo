# rc_repo

Shell + tools setup repo (Zsh, Vim, tmux, plus assorted terminal assets like colorschemes/fonts).

## Structure

- `dotfiles/`
  - `zsh/`
    - `zshrc`: the real Zsh config
    - `aliases.zsh`: aliases sourced by Zsh
  - `vim/`
    - `vimrc`: the real Vim config
- Root “entrypoint” dotfiles
  - `.zshrc` → sources `dotfiles/zsh/zshrc`
  - `.aliases_zsh` → sources `dotfiles/zsh/aliases.zsh`
  - `.vimrc` → sources `dotfiles/vim/vimrc`
  - `.tmux.conf` → tmux config (single source of truth)
- Other folders
  - `colorschemes/`: iTerm color presets
  - `fonts/`: font files
  - `dircolors/`: dircolors project subtree

## Install / Update

Run the setup script to symlink the repo-managed dotfiles into place, backing up any existing files it replaces.

```bash
./setup.sh
```

This links:

- `~/.zshrc` → `<repo>/.zshrc`
- `~/.aliases_zsh` → `<repo>/.aliases_zsh`
- `~/.vimrc` → `<repo>/.vimrc`
- `~/.vimpressrc` → `<repo>/.vimpressrc`
- `~/.tmux.conf` → `<repo>/.tmux.conf`

Backups go to:

- `~/backup_config/<YYYYMMDD_HHMMSS>/`

If you want the script to attempt setting your login shell to zsh:

```bash
./setup.sh --set-default-shell
```

## Local-only overrides (secrets, machine-specific paths)

Do not put API keys or machine-specific secrets in this repo.

For per-machine overrides, put them in:

- `~/.zshrc.local`

It will be sourced automatically (if present) by `dotfiles/zsh/zshrc`.
