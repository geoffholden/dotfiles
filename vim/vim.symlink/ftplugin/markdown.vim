set linebreak
set breakindent
set showbreak=\ \ \ \ 
noremap j gj
noremap k gk

function! MakeIfMakefile()
    if filereadable("./Makefile") && !filereadable("./config.toml")
        Make!
    endif
endfunction

autocmd BufWritePost * silent call MakeIfMakefile()

set spell

