" Dont use bracket shortcuts
let g:use_brackets= 0

" Break lines after X chars
setl textwidth=80

" Stop formating lines in insert mode
au filetype markdown set fo-=t
au filetype markdown set fo+=l

set wrap

" Wrap long lines on save
" TODO dont format heading and comments
" autocmd bufwritepre * :normal! gggqG
