" Add custom types to highlight group
fun! SetMyTypes()
    syn keyword myTypes ll string
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
