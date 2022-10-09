" dashboard
let g:session_enable = get(g:,'dashboard_enable_session',1)

if g:session_enable
  " Save and persist session
  command! -nargs=? -complete=customlist,sessions#session#session_list SessionSave
    \ call sessions#session#session_save(<q-args>)

  " Load and persist session
  command! -nargs=? -complete=customlist,sessions#session#session_list SessionLoad
    \ call sessions#session#session_load(<q-args>)

  " Save session on quit if one is loaded
  augroup plugin_sessions
    autocmd!
    " If session is loaded, write session file on quit
    autocmd VimLeavePre *
      \ if ! empty(v:this_session) && ! exists('g:SessionLoad')
      \ |   execute 'mksession! ' . fnameescape(v:this_session)
      \ | endif
  augroup END
endif
