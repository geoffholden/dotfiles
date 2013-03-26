" General Option
set nocompatible

" Events
filetype plugin indent on

" In makefiles do not expand tabs
autocmd FileType make setlocal noexpandtab
" omnicompletion (^X,^O)
set ofu=syntaxcomplete#Complete

" Theme
set t_Co=256
colorscheme molokai

syntax enable

" JSON
autocmd BufRead,BufNewFile *.json setfiletype json
autocmd Syntax json sou ~/.vim/syntax/json.vim

" Protocol Buffers
autocmd BufRead,BufNewFile *.proto setfiletype proto
autocmd Syntax proto sou ~/.vim/syntax/proto.vim

" Arduino keywords.txt
autocmd BufRead,BufNewFile keywords.txt setlocal ft=keywords
autocmd FileType keywords setlocal noexpandtab

" Vim UI
set number
set nohlsearch
set incsearch
set ruler
set scrolloff=4

" Text Formatting
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

