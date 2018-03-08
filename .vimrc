"START{{{
set nocompatible
filetype off
"}}}
" PLUGINS {{{
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'

"Undo
"Plug 'sjl/gundo.vim'

"git interface
"Plug 'tpope/vim-fugitive'

"filesystem
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"Plug 'kien/ctrlp.vim'

"markdown
"Plug 'isnowfy/python-vim-instant-markdown'
"Plug 'suan/vim-instant-markdown'
"Plug 'nelstrom/vim-markdown-preview'

"html
"Plug 'mattn/emmet-vim'

"python syntax checker
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'

"auto-completion stuff
"Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
"Plug 'klen/rope-vim'
Plug 'davidhalter/jedi-vim'
"Plug 'rkulla/Pydiction'
"Plug 'ervandew/supertab'

"code folding
Plug 'tmhedberg/SimpylFold'

"UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Colors!!
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'liuchengxu/space-vim-dark'

"Searching 
"Plug 'ggreer/the_silver_searcher'

"Notes
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

"Wordpress
"Plug 'danielmiessler/VimBlog'

call plug#end()

"}}}
" COLORS {{{
colorscheme space-vim-dark
hi Comment cterm=italic
syntax enable
call togglebg#map("<F5>")
set t_Co=256
"}}}
" SPACE&TABS{{{
set tabstop=4
set softtabstop=4
set expandtab
"}}}
" UICONFIG {{{
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch
filetype indent on "load filetype specific indent files
set encoding=utf-8
"}}}
"SEARCHING{{{
set incsearch
"set hlsearch 
"}}}
"FOLDING{{{
set foldenable
set foldlevelstart=10 "open most folds by default
set foldnestmax=10
set foldmethod=indent "options: marker,manual, expr, syntax, diff
noremap <leader>, za<CR> "space open/closes folds
"}}}
"MOVEMENT{{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"}}}
"LEADER{{{
let mapleader=","
inoremap jk <esc>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <silent><leader>v : NERDTreeFind<CR>
nnoremap <leader>a :NERDTreeToggle<CR>
"}}}
" AUTOGROUP {{{
augroup configgroup
        autocmd!
        " Python
        au BufRead,BufNewFile *.py,*.pyw set expandtab
        au BufRead,BufNewFile *.py,*.pyw set textwidth=139
        au BufRead,BufNewFile *.py,*.pyw set tabstop=4
        au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
        au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
        au BufRead,BufNewFile *.py,*.pyw set autoindent
        au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
        au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
        au         BufNewFile *.py,*.pyw set fileformat=unix
        au BufRead,BufNewFile *.py,*.pyw let b:comment_leader = '#'
        au FileType python set autoindent
        au FileType python set foldmethod=indent

        "NERDTree autocmds
        au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

        " HTML
        au BufRead,BufNewFile *.html set filetype=xml
        au BufRead,BufNewFile *.html set expandtab
        au BufRead,BufNewFile *.html set tabstop=4
        au BufRead,BufNewFile *.html set softtabstop=4
        au BufRead,BufNewFile *.html set shiftwidth=4
        au BufRead,BufNewFile *.html set autoindent
        au BufRead,BufNewFile *.html match BadWhitespace /^\t\+/
        au BufRead,BufNewFile *.html match BadWhitespace /\s\+$/
        au         BufNewFile *.html set fileformat=unix
        au BufRead,BufNewFile *.html let b:comment_leader = '<!--'
" }}}
" BACKUP {{{
"set backup
"set backupdir=~/.vim-tmp, ~/.tmp, ~/tmp,/var/tmp, /tmp
"set backupskip=/tmp/*, private/tmp/*
"set directory=~/tmp,
"set writebackup
"}}}
" PYTHON {{{
set encoding=utf-8
set backspace=indent,eol,start
let python_highlight_all=1
syntax on
highlight BadWhitespace ctermbg=red guibg=red

" python with virtualenv support
py <<EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF
" }}}
"PLUGIN SETTINGS {{{
" NERDTREE {{{
let NERDTreeIgnore=['\.pyc$','\~$'] "ignore files in NERDTree
let g:NERDTreeWinPos = "left"
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
"let NERDTreeShowHidden=1
" }}}
" AIRLINE {{{
set laststatus=2
let g:airline_right_sep="<"
let g:airline_left_sep=">"
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_spell=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 1
"let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#obsession#enabled = 1
"let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline_section_c ='%<%F%m%#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
"let airline#extensions#tabline#disable_refresh = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#show_close_button = 0 
" }}}
"NOTES{{{
let g:notes_suffix='.txt'
let g:notes_directories=['~/workspace/notes']
let g:notes_unicode_enabled = 1
"}}}
"CtrlP{{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"}}}
"Pydiction {{{
filetype plugin on
let g:pydiction_location="~/.vim/plugged/Pydiction/complete_dict"
let g:pydiction_menu_height = 3
""}}}
" JEDI {{{
"}}}
""}}}
"OTHERS{{{
" Enable split
set splitbelow
set splitright
"}}}

" VIMRC Fold settings
set modelines=1
" vim:foldmethod=marker:foldlevel=0
