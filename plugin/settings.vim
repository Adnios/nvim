" enhance jk
" nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
" nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

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

command! -nargs=0 VSCode        execute ":!code -g %:p\:" . line('.') . ":" . col('.')
