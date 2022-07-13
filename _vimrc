"Disable compatibility with vi which can cause unexpected issues.
set nocompatible

"Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

"Enable plugins and load plugin for the detected file type.
filetype plugin on

"Load an indent file for the detected file type.
filetype indent on

"Turn suntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Set font.
set guifont=Consolas:h12

" Default colorscheme.
colorscheme molokai
let g:molokai_original = 1
let g:molokai_italic = 0

" Do not move cursor to matching bracket
set noshowmatch

" Mappings
inoremap ii <esc>

" Maximize window
autocmd GUIEnter * simalt ~x

" Set path to current file path
autocmd BufEnter * silent! lcd %:p:h   
autocmd BufWritePost * silent! lcd %:p:h

" Add custom types to highlight group
fun! SetMyTodos()
    syn keyword myTypes ll
    hi link myTypes Type
endfu
autocmd bufenter * :call SetMyTodos()
autocmd filetype * :call SetMyTodos()

" Show current row and column
set ruler
