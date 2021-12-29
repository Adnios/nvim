" https://github.com/Adnios/dotfiles-ubuntu/blob/25e8150bcc/.config/nvim/config/
" https://github.com/imxiejie/ThinkVim/blob/develop/core/core.vim

" Indents word-wrapped lines as much as the 'parent' line
set breakindent
set breakindentopt=sbr
" Ensures word-wrap does not split words
" set formatoptions=l
set lbr

" jump last place
autocmd BufReadPost * call s:resume_position()
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" autocmd BufRead * autocmd FileType <buffer> ++once
"       \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
" autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && line(".") == 1 |
"                 \ exe "normal! g'\"" |
"                 \ endif "jump to last position last open in vim
" autosave
autocmd CursorHold * silent! update

set cursorline
