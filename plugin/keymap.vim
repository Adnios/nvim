" vim mapping
nnoremap <C-x>h :set hls!<CR>
nnoremap <C-x>k :bdelete<CR>
nnoremap Y y$
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <M-k> :resize +2<CR>
nnoremap <M-j> :resize -2<CR>
nnoremap <M-h> :vertical resize +2<CR>
nnoremap <M-l> :vertical resize -2<CR>

" replace tab with space
" nnoremap <key> :retab<CR>

cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>
