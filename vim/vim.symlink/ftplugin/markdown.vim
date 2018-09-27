set linebreak
set breakindent
set breakindentopt=shift:4
noremap j gj
noremap k gk

function! MakeIfMakefile()
    if filereadable("./Makefile") && !filereadable("./config.toml")
        Make!
    endif
endfunction

autocmd BufWritePost * silent call MakeIfMakefile()

set spell

iab <expr> dts substitute(strftime("%Y-%m-%dT%H:%M:%S%z"), '\([+-]\)\([0-9]\+\)\([0-9][0-9]\)$', '\1\2:\3', '')

" VimCompletesMe {{{
let b:vcm_tab_complete = 'dict'
" Don't autocomplete after a -
inoremap -<Tab> -<Tab>
" }}}

