" Add custom types to highlight group
fun! SetMyTypes()
    syn keyword myTypes ll string
    syn match cppType "\<type_\w\+\>"
    hi link myTypes Type
endfu
autocmd bufenter * :call SetMyTypes()
autocmd filetype * :call SetMyTypes()

" Comment current line
fun! CommentLine()
    normal! yy
    if @" =~# '^\s*\/\/.*'
        normal! ^d2l
    else
        normal! I//
    endif
endfu

" Create nested for loops
fun! For(...)
    let varnames = ['i','j','k','l','m','n','o']
    let c = 0
    if a:0 == 0
        call inputsave()
        let temp = input("Limits: ")
        let args = split(temp)
        call inputrestore()
        for l in args
            exec "normal! a" . "for(int " . varnames[c] . " = 0;" . varnames[c] . "<" . l . ";" . varnames[c] . "++)\<Esc>"
            let c += 1
        endfor
    else
        for l in a:000
            exec "normal! a" . "for(int " . varnames[c] . " = 0;" . varnames[c] . "<" . l . ";" . varnames[c] . "++)\<Esc>"
            let c += 1
        endfor
    endif
endfu

let mapleader = " "

noremap <silent> <leader>/ :call CommentLine()<cr>
nnoremap <silent> <leader>f :call For()<cr>

" Load cpp template
fun! Init()
    let path = expand("%:p")
    if filereadable($TEMPLATES . "/cpp") && (stridx(path,"Kody") != -1 || stridx(path,"Skola") != -1)
        exec "r " . $TEMPLATES . "/cpp"
        normal! 0ggdd17gg
    elseif filereadable($TEMPLATES . "/cpp_basic")
        exec "r " . $TEMPLATES . "/cpp_basic"
        normal! 0ggdd5gg
    endif
endfu

au bufnewfile * :call Init()
setlocal foldmethod=syntax
setlocal foldlevel=20
