"Pathogen plugin
call pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

let mapleader = ","

"Searching and moving around
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"Handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

"Disable arrow keys
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"Disable F1 because you always hit it when you want esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"Can use ; for :
nnoremap ; :

"Save on losing focus
au FocusLost * :wa

"Re-hardwrap paragraphs of text
nnoremap <leader>q gqip

"Reselect text that was just pasted
nnoremap <leader>v V`]

"Open $MYVIMRC in a vertical split
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"Sort CSS properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?<CR>k:sort<CR>:noh<CR>

"Quicker escaping
inoremap jj <ESC>

"New vertical split and switch to it
nnoremap <leader>w <C-w>v<C-w>l

"Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

colorscheme Mustang
set guifont=Menlo:h12,DejaVu\ Sans\ Mono\ Book\ 12

let g:ackprg="ack -H --nocolor --nogroup --column"

nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

"Automate tabularization of cucumber features
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
