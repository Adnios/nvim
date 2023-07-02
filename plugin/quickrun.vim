" Compile function
noremap <leader><CR> :call QuickRun()<CR>
" noremap <leader><CR> :QuickRun<CR>
func! QuickRun()
  exec "w"
  if &filetype == 'c'
    TermExec cmd='g++ -std=c++17 % -o run && ./run'
    " exec "!g++ % -o %<"
    " exec "!time ./%<"
  elseif &filetype == 'cuda'
    TermExec cmd='nvcc % -o run && ./run'
    " exec "!nvcc % -o %<"
    " :sp
    " :res -15
    " :term ./%<
  elseif &filetype == 'cpp'
    TermExec cmd='g++ -std=c++17 % -o run && ./run'
    " set splitbelow
    " exec "!g++ -std=c++11 % -Wall -o %<"
    " :sp
    " :res -15
    " :term ./%<
  elseif &filetype == 'sh'
    TermExec cmd='bash %'
    " :!time bash %
  elseif &filetype == 'python'
    TermExec cmd='python %'
    " set splitbelow
    " :sp
    " :term python3 %
  elseif &filetype == 'markdown'
    exec "InstantMarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  endif
endfunc
