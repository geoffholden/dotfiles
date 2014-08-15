" General Option
set nocompatible

filetype off

" Load pathogen for plugin management
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
Helptags

set noswapfile

" Events
filetype on
filetype plugin indent on

" In makefiles do not expand tabs
autocmd FileType make setlocal noexpandtab

" Ruby uses 2-character indents
autocmd FileType ruby setlocal ts=2 sts=2 sw=2

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

" Arduino Sketches
autocmd BufRead,BufNewFile *.pde,*.ino set filetype=cpp
autocmd BufRead,BufNewFile *.pde,*.ino setlocal ts=2 sts=2 sw=2

" Vim UI
set number
set nohlsearch
set incsearch
set ruler
set scrolloff=4
set cursorline

" Text Formatting
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
set laststatus=2

let mapleader = ","
set spelllang=en_ca
set nospell
nnoremap <silent> <Leader>b :TagbarToggle<CR>
nmap <leader>g :tag<space>
set listchars=tab:▸\ ,eol:¬

highlight ColorColumn ctermbg=234 guibg=#293739
if exists('+colorcolumn')
    set colorcolumn=80
endif

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map ,w :call StripWhitespace ()<CR>

" neocomplete
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 79,
      \ 'x': 60,
      \ 'y': 120,
      \ 'z': 45,
      \ }

if has('macunix')
    set guifont=Menlo\ for\ Powerline
endif

set foldmethod=syntax
set foldnestmax=2
set nofoldenable
nnoremap [of :set foldenable<CR>
nnoremap ]of :set nofoldenable<CR>
nnoremap cof :set <C-R>=eval('&foldenable') ? 'nofoldenable' : 'foldenable'<CR><CR>

" No folding of commits
autocmd FileType gitcommit setlocal nofoldenable

if has("autocmd")
    autocmd BufWritePost .vimrc source $MYVIMRC
    autocmd BufWritePost vimrc source $MYVIMRC
endif

" Disable Arrow Keys
inoremap <Up> <Nop>
noremap  <Up> <Nop>
inoremap <Down> <Nop>
noremap  <Down> <Nop>
inoremap <Left> <Nop>
noremap  <Left> <Nop>
inoremap <Right> <Nop>
noremap  <Right> <Nop>

" Projects don't get spell checked
autocmd FileType todo syntax match TodoProject ' +[^[:blank:]]\+' contains=@NoSpell

