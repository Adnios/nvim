" https://github.com/Adnios/dotfiles-ubuntu/blob/25e8150bcc/.config/nvim/config/
" https://github.com/imxiejie/ThinkVim/blob/develop/core/core.vim

" Indents word-wrapped lines as much as the 'parent' line
set breakindent
set breakindentopt=sbr
" Ensures word-wrap does not split words
set formatoptions=l
set lbr
" jump last place
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" autosave
autocmd CursorHold * silent! update
" open with code
command! -nargs=0 VSCode        execute ":!code -g %:p\:" . line('.') . ":" . col('.')
" make `set expandtab` work in vim(https://github.com/MwumLi/mini-vim/blob/master/vimrc)
set nomodeline
