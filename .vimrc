


scriptencoding utf-8

" We need full power of vim
set nocompatible

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

" Makes vim liberal about quitting not saved buffer
set hidden
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


" Moving beetwin windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Indementation
nmap <C-[> <<
nmap <C-]> >>
vmap <C-[> <gv
vmap <C-]> >gv


" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>


" Those mappings can help while moving in wrapperd lines
vmap <C-j> gj
vmap <C-k> gk
vmap <C-4> g$
vmap <C-6> g^
vmap <C-0> g^
nmap <C-j> gj
nmap <C-k> gk
nmap <C-4> g$
nmap <C-6> g^
nmap <C-0> g^

" Fast editing of .vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>


execute pathogen#infect()


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


if has("autocmd")
    " Enable file type detection
    filetype on

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



" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif




