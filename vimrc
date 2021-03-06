


scriptencoding utf-8

" We need full power of vim
set nocompatible

" Colorscheme
colo slate

" We don't need backup files
set nobackup
set noswapfile

" By default hide linenumbers
set nonumber

" Searching options
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase


" Omnicompletion settings
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
set gdefault

" Linendings
set backspace=indent,eol,start
set linespace=0

" Tabs and spaces
set ts=4 sts=4 sw=4 expandtab
set autoindent
set smartindent

" Status line
set laststatus=2

" Makes vim liberal about quitting not saved buffer
set showmode
set cursorline


" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Use par as paragraph formatter
set formatprg=par
set formatprg=par\ -w80


" Linebreaks
set nowrap
set linebreak
set showbreak=…
command! -nargs=* Wrap set wrap linebreak nolist

let mapleader="\\"

" Moving beetwin windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l



" Fast editing of .vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>



function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Colorscheme
set cursorline
set t_Co=256 " this tells vim to use 256 colors... always
colo vividchalk


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'

Plugin 'benmills/vimux'

Plugin 'wincent/Command-T'

call vundle#end()

if has("autocmd")
    " Enable file type detection
    filetype plugin indent on

    autocmd FileType make       setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html       setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css        setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab

    autocmd BufNewFile,BufRead *.rss  setfiletype xml
    autocmd BufNewFile,BufRead *.twig setfiletype html

    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

    " Source .vimrc everytime its changed
    autocmd bufwritepost .vimrc source $MYVIMRC
endif


" Settings for VimClojure
let g:clj_highlight_builtins=1      " Highlight Clojure's builtins
let g:clj_paren_rainbow=1           " Rainbow parentheses'!

let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
let g:vimclojure#FuzzyIndent = 1
let g:vimclojure#WantNailgun = 0


let g:CommandTFileScanner = "git"

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif


function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <LocalLeader>r "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <LocalLeader>r vip<LocalLeader>vs<CR>


