set linebreak
set breakindent
set showbreak=\ \ \ \ 
noremap j gj
noremap k gk

function! MakeIfMakefile()
    if filereadable("./Makefile")
        Make!
    endif
endfunction

autocmd BufWritePost * silent call MakeIfMakefile()

