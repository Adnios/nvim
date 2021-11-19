" https://github.com/thinca/config/blob/master/dotfiles/dot.vim/vimrc
" Startup time.
if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * ++once
    \                   let g:startuptime = reltime(g:startuptime)
    \                 | redraw
    \                 | echomsg 'startuptime: ' .. reltimestr(g:startuptime)
  augroup END
endif
