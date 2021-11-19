" Compile function
noremap <leader><CR> :call QuickRun()<CR>
func! QuickRun()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -15
    :term ./%<
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'markdown'
    exec "InstantMarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  endif
endfunc
