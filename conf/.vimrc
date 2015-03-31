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
Bundle "t9md/vim-chef"
Bundle "rodjek/vim-puppet"
Bundle "tpope/vim-fugitive"
Bundle "gregsexton/gitv"
Bundle "vim-scripts/netrw.vim"
Bundle "elzr/vim-json"
Bundle "pangloss/vim-javascript"

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

" Relative line numbers
set rnu

" Window navigation
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Allow backspacing  over everething including indent, eol in insert mode 
set backspace=2

" option to aid in pasting text unmodified from other applications
set paste

" Fix issue related to markdown preview with zsh
au BufRead,BufNewFile *.md set filetype=markdown
au FileType markdown setl shell=bash\ -i

" enable spellchecker 
" set spell

" Enable plugins in folder ~/.vim/plugin
" set runtimepath+=$home/.vim/plugin

" ##########################
" Bundle configurations

" Add powerline: vim-airline
set laststatus=2
let g:airline_theme='badwolf'
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

" Switch buffer
set hidden
set switchbuf=usetab
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>

" Switch tabs
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>

" Enable neocomplete at startup
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

 " Plugin key-mappings.
 inoremap <expr><C-g>     neocomplete#undo_completion()
 inoremap <expr><C-l>     neocomplete#complete_common_string()

 " Recommended key-mappings.
 " <CR>: close popup and save indent.
 inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
 function! s:my_cr_function()
     return neocomplete#close_popup() . "\<CR>"
 endfunction

 " <TAB>: completion.
 inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

 " <C-h>, <BS>: close popup and delete backword char.
 inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
 inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
 inoremap <expr><C-y>  neocomplete#close_popup()
 inoremap <expr><C-e>  neocomplete#cancel_popup()

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.

let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle = 3

" Change directory to the current buffer when opening files.
set autochdir

" Default mapping for Multiple Cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
