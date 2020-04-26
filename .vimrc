execute pathogen#infect()
syntax on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700
"set clipboard=unnamedplus

" mapping jk to escape 
inoremap jk <esc>


" Set to auto read when a file is changed from the outside
set autoread

"set line number
set number


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
let localleader = "\\"

" edit and source my vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <Enter> o<ESC>

"visually select a word put into something
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel


"move end and the beginning of the line 
nnoremap B 0
nnoremap E $
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch


" Show matching brackets when text indicator is over them
"set showmatch  

set nosm
" How many tenths of a second to blink when matching brackets
"set mat=1

let g:loaded_matchparen=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
"""""""""""""""ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

set t_Co=256


"colorscheme molokai
set background=light
" Set utf8 as standard encoding and en_US as the standard language set encoding=utf8 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " => Files, backups and undo """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn automatic backup off 
set nobackup
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"my first function
"for toggling the syntax 
function! ToggleSyntax()
   if exists("g:syntax_on")
          syntax off
   else
         syntax enable
   endif
endfunction
nmap <silent> ;s :call ToggleSyntax()

" => Plugins
" """""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
  map <C-g> :NERDTreeToggle<CR>
"search operations with nerdtreefind 
  nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let python_highlight_all=1


" => Autocmds
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup group1           " for appendig automatically
:autocmd BufWritePre,BufRead *.html :normal gg=G
:autocmd BufWritePre,BufRead *.py :normal gg=G
:autocmd BufWritePre,BufRead *.cpp :normal gg=G
:autocmd BufWritePre,BufRead *.c :normal gg=G
:autocmd BufWritePre,BufRead *.java :normal gg=G
:autocmd BufWritePre,BufRead *.css :normal gg=G
augroup end

augroup group2       "for comments
:autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
augroup end

"""""""vim-closetag

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

"""""""html

augroup group3
:autocmd Filetype html nnoremap <buffer> <space> za 
:autocmd Filetype html vnoremap <buffer> <space> zf
augroup end


nnoremap <F5> :silent update<Bar>silent !firefox %:p &<CR>


""""""""delimitmate
let delimitMate_expand_cr = 1
