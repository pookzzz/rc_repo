" This must be first, because it changes other options as side effect
set nocompatible
filetype off

set runtimepath+=~/.vim_runtime

"source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Plugin managers, Vundle, Pathogen...
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'

"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

"html
Plugin 'isnowfy/python-vim-instant-markdown'
"Plugin 'jtratner/vim-flavored-markedown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'

"python syntax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"auto-completion stuff
"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'ervandew/supertab'

"code folding
Plugin 'tmhedberg/SimpylFold'

"UI
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Colors!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

call vundle#end()

filetype plugin indent on "enables filetype detection
let g:SimpylFold_docstring_preview =1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
let mapleader=" "
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

call togglebg#map("<F5>")

let NERDTreeIgnore=['\.pyc$','\~$'] "ignore files in NERDTree
" Quickly edit/reload the vimrc file

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

let python_highlight_all=1
syntax on

"No swapfile
set noswapfile

"Turn on numbering
set nu
set clipboard=unnamed

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable split
set splitbelow
set splitright

" UTF8 Support
set encoding=utf-8

" Enable folding with the spacebar
nnoremap <space> za

" Cursor line
set cursorline
highlight Cursorline guibg=lightblue ctermbg=lightgray
"set cursorcolumn

" Tooltips
set ballooneval
set balloondelay=400
set balloonexpr="textstring"

" Python stuff
au BufNewFile,BufRead *.py 
	\ set tabstop=4    | 
	\ set softtabstop=4|
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab   |
	\ set autoindent |
	\ set fileformat=unix|

au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2|
	\ set softtabstop=2|
	\ set shiftwidth=2|

" python with virtualenv support
py <<EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

"autocmd FileType python set omnifunc=pythoncomplete#Complete

"Start Python PEP 8 Stuff 
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py, *.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py, *.pyw, set textwidth=100
au BufRead,BufNewFile *.py, *.pyw, *.c, *.h set fileformat=unix
set encoding=utf-8
let python_highlight_all=1
syntax on
autocmd FileType python set autoindent
set backspace=indent,eol,start
autocmd FileType python set foldmethod=indent
nnoremap <space> za

"Nerdtree settings
let NERDTreeIgnore=['\.pyc$','\~$'] "ignore files in NERDTree
let g:NERDTreeWinPos = "left"
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
"let NERDTreeShowHidden=1
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd Vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <silent> <Leader>v : NERDTreeFind<CR>
"autocmd StdinReadPre * let s:std_in=1
"autocmd Vimenter * if argc()==1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Airline
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
set t_Co=256
set noshowmode
