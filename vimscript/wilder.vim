call wilder#enable_cmdline_enter()
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"
set wildcharm=<Tab>

" Enable cmdline completion (for Neovim only)
call wilder#set_option('modes', ['/', '?', ':', '-'])

" call wilder#set_option('noselect', 0)

let s:wilder_show_history = 0
function! s:wilder_toggle_history() abort
    let s:wilder_show_history = 1 - s:wilder_show_history
    call timer_start(0, {-> feedkeys("\<BS>")})
    " return space which is then deleted by the <BS> to trigger CmdlineChanged
    return ' '
endfunction
cmap <expr> <C-F> wilder#in_context() ? <SID>wilder_toggle_history() : "\<C-F>"

call wilder#set_option('pipeline', [
      \    wilder#branch(
      \     [
      \       wilder#check({-> s:wilder_show_history}),
      \       wilder#history(100),
      \       {ctx, xs -> filter(xs, {i, x -> match(x, ctx.input) != -1})},
      \     ],
      \     [
      \       wilder#check({_, x -> empty(x)}),
      \       wilder#history(100),
      \     ],
      \     wilder#python_file_finder_pipeline({
      \       'file_command': {_, arg -> stridx(arg, '.') != -1 ? ['fd', '-tf', '-H'] : ['fd', '-tf']},
      \       'dir_command': ['fdfind', '-td'],
      \       'cache_timestamp': {-> 1},
      \       'debounce': 50,
      \     }),
      \     wilder#substitute_pipeline({
      \       'fuzzy':1,
      \       'use_python':1,
      \       'debounce': 50,
      \     }),
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \       'set_pcre2_pattern': 0,
      \       'use_python': 1,
      \       'debounce': 50,
      \     }),
      \     wilder#python_search_pipeline({
      \       'regex': 'fuzzy',
      \       'engine': 're2',
      \       'debounce': 50,
      \       'pattern': wilder#python_fuzzy_pattern({
      \        'start_at_boundary': 0,
      \     }),
      \       'sort': wilder#python_sorter_difflib(),
      \     }),
      \     ),
      \   wilder#result_draw_devicons(),
      \  ])


let s:accent_fg = "#ea4298"
hi Pmenu  ctermfg=0 ctermbg=13 guifg=#a9b1d6 guibg=NONE

call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
      \   'default': 'Pmenu',
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': s:accent_fg}]),
      \ },
      \ }))
