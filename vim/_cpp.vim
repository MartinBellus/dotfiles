" Add custom types to highlight group
fun! SetMyTypes()
    syn keyword myTypes ll string
    syn match cppType "\<type_\w\+\>"
    hi link myTypes Type
endfu
autocmd bufenter * :call SetMyTypes()
autocmd filetype * :call SetMyTypes()

let mapleader = " "
fun! CommentLine()
    normal! yy
    if @" =~# '^\s*\/\/.*'
        normal! ^d2l
    else
        normal! I//
    endif
endfu
noremap <silent> <leader>/ :call CommentLine()<cr>

fun! Init()
    if filereadable($TEMPLATES . "/cpp")
        exec "r " . $TEMPLATES . "/cpp"
        normal! 0ggdd16gg
    endif
endfu
au bufnewfile * :call Init()
setlocal foldmethod=syntax
setlocal foldlevel=20
