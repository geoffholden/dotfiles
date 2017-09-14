set linebreak
set breakindent
set breakindentopt=shift:4
noremap j gj
noremap k gk

set spell

" VimCompletesMe {{{
let b:vcm_tab_complete = 'dict'
" Don't autocomplete after a -
inoremap -<Tab> -<Tab>
" }}}

