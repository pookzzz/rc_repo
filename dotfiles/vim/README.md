# Vim Setup

This repo keeps the Vim config in [vimrc](file:///Users/bytedance/workspace/rc_repo/dotfiles/vim/vimrc). The root `.vimrc` just sources it.

## Install

- Run the repo setup to install `vim-plug` (if needed) and link dotfiles:

```bash
./setup.sh
```

- Inside Vim, install plugins:

```vim
:PlugInstall
```

Common plugin maintenance:

```vim
:PlugUpdate
:PlugClean
```

## Key Mappings

Leader is `,`.

- Insert mode
  - `jk`: escape to normal mode
- Splits
  - `Ctrl-h/j/k/l`: move between splits
- Folding
  - `,,`: toggle fold under cursor
- Buffers
  - `,l`: next buffer
  - `,;`: previous buffer
- NERDTree
  - `,a`: toggle tree
  - `,v`: reveal current file in tree
- Config
  - `,ev`: open vimrc in a vertical split
  - `,sv`: reload vimrc
  - `,ez`: open `~/.zshrc` in a vertical split

## Defaults

- Tabs/spaces: 4 spaces by default, with Python/HTML using `expandtab` and 4-space indents via `FileType` settings.
- Search: incremental search enabled.
- UI: line numbers, cursorline, wildmenu, and airline enabled.
- Whitespace: highlights trailing whitespace and leading tabs.

## Notes

The `vim-notes` plugin is enabled. Notes directory is chosen automatically:

- `~/workspace/notes` if it exists and is writable
- otherwise `~/notes`
