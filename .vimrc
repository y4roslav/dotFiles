" .vimrc file. Author: Yaroslav Ravlinko aka RosL!nk

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
colorscheme koehler

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
"
" My Bundle here
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "vadv/vim-chef"
Bundle "The-NERD-tree"
Bundle "bling/vim-airline"
Bundle "Valloric/YouCompleteMe"

filetype plugin indent on

" Set font for powerline
set guifont=Anonymous\ Pro\ for\ Powerline

" Set encoding to Unicode 
set encoding=utf-8

" Enable collor scheme for appropriate type of file 
syntax on

" Enable number field for every file
set number

" Setup a long of tabulation to 4 (for python and ruby script)
set softtabstop=4 

" Enable plugins in folder ~/.vim/plugin
" set runtimepath+=$home/.vim/plugin

" Enable syntax for chef files
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

" Add power line: vim-airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1
let g:airline_enable_syntastic=1
let g:airline_detect_modified=1

" Allow backspacing  over everething including indent, eol in insert mode 
set backspace=2

" option to aid in pasting text unmodified from other applications
set paste
