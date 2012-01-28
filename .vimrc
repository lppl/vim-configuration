

set nocompatible

set number

scriptencoding utf-8

set nobackup
set noswapfile

set hidden
set showmode
set cursorline

set backspace=indent,eol,start
set linespace=0

set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
set gdefault 
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4

set autoindent
set smartindent

map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-L> <C-W>l<C-W>
map <C-H> <C-W>h<C-W>


let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>ov :so $MYVIMRC<cr>


nnoremap ; :



call pathogen#infect()
syntax on
colorscheme evening
filetype plugin indent on

if has("autocmd")

endif

augroup filetype

augroup END





