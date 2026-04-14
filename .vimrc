" Resolve the absolute path to this .vimrc file, taking symlinks into account
let s:this_file = resolve(expand('<sfile>:p'))
" Source the target vimrc file relative to this file's resolved location
execute 'source ' . fnameescape(fnamemodify(s:this_file, ':h') . '/dotfiles/vim/vimrc')
