" setlocal colorcolumn=120
" textwidth=78 is set by /usr/share/nvim/runtime/ftplugin/vim.vim.
setlocal textwidth=0
" make `set expandtab` work in vim(https://github.com/MwumLi/mini-vim/blob/master/vimrc)
set nomodeline
setlocal expandtab
setlocal iskeyword+=:,#
setlocal tags+=$DATA_PATH/tags
