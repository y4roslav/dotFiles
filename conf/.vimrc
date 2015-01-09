" .vimrc file. Author: Yaroslav Ravlinko aka RosL!nk
set nocompatible "must be first line

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
colorscheme koehler

" let Vundle manage Vundle
" " required! 
Bundle "gmarik/vundle"
"
" My Bundle here
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "vadv/vim-chef"
Bundle "The-NERD-tree"
Bundle "bling/vim-airline"
Bundle "syntastic"
Bundle "Tagbar"
Bundle "suan/vim-instant-markdown"
Bundle "fatih/vim-go"
if has('lua')
  Bundle "Shougo/neocomplete"
  Bundle "Shougo/neosnippet"
  Bundle "Shougo/neosnippet-snippets"
end
Bundle "terryma/vim-multiple-cursors"
Bundle "kien/ctrlp.vim"

filetype plugin indent on

" Set encoding to Unicode 
set encoding=utf-8

" Set GUI font size 
set guifont=Menlo\ Regular:h12

" Enable collor scheme for appropriate type of file 
syntax on

" Ser fort tab for ruby
set tabstop=2 shiftwidth=2 expandtab

" Enable number field for every file
set number

" Allow backspacing  over everething including indent, eol in insert mode 
set backspace=2

" option to aid in pasting text unmodified from other applications
set paste

" Enable syntax for chef files
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

" enable spellchecker 
" set spell

" Enable plugins in folder ~/.vim/plugin
" set runtimepath+=$home/.vim/plugin

" ##########################
" Bundle configurations

" Add powerline: vim-airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_enable_syntastic=1
let g:airline_detect_modified=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Change separator 
let g:airline_left_sep = '|'
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = '|'
let g:airline_right_alt_sep = '|'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" #############################
" View > Toogle > ..

" Toggle tagbar 
nmap <F8> :TagbarToggle<CR>

" Toggle NERDTree
map <C-d> :NERDTreeToggle<CR>

" Neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Switch buffer
set hidden
set switchbuf=usetab
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>

" Switch tabs
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
