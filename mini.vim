scriptencoding utf-8
set encoding=utf-8
set nocompatible
set runtimepath^=~/.cache/vim/dein/repos/github.com/neoclide/coc.nvim_release
filetype plugin indent on

inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
