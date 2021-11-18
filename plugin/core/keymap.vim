" plugins
nnoremap <leader>z :ZenMode<CR>
nnoremap <leader>tr :call dein#recache_runtimepath()<CR>
nnoremap <leader>e :Defx<CR>
nnoremap <leader>om :MarkdownPreview<CR>
nnoremap <leader>v :Vista!!<CR>
nnoremap <leader>r :RnvimrToggle<CR>
nnoremap <C-\> :ToggleTerm<CR>
nnoremap <leader>ss :SessionSave<CR>
nnoremap <leader>sl :SessionLoad<CR>
" highight replace visual seclect
xmap p <Plug>(operator-replace)

" vim mapping
nnoremap <C-x>h :set hls!<CR>
nnoremap <C-x>k :Bdelete<CR>
nnoremap Y y$
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" replace tab
" :%retab%<CR>

cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>
