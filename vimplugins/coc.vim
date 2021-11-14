let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
let g:coc_disable_transparent_cursor = 1
let g:coc_global_extensions = [
            \ 'coc-pyright',
            \ 'coc-texlab',
            \ 'coc-spell-checker',
            \ 'coc-gitignore',
            \ 'coc-tabnine',
            \ 'coc-json',
            \ 'coc-diagnostic',
            \ 'coc-highlight',
            \ 'coc-lists',
            \ 'coc-lua',
            \ 'coc-yaml',
            \ 'coc-marketplace',
            \ 'coc-vimlsp'
            \ ]
set hidden
set nobackup
set nowritebackup
" coc-git
" navigate chunks of current buffer
" nmap [g <Plug>(coc-git-prevchunk)
" nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
" nmap [c <Plug>(coc-git-prevconflict)
" nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
" nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
" nmap gm <Plug>(coc-git-commit)

nmap <silent> [c :call CocAction('diagnosticNext')<cr>
nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <leader>ca :<C-u>CocList -I grep<cr>
nnoremap <leader>cf :<C-u>CocList files<cr>
nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
nnoremap <silent> <localleader>y  :<C-u>CocList -A --normal yank<cr>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

hi CocErrorHighlight gui=undercurl guisp=#902020
hi CocWarningHighlight gui=undercurl guisp=#909020
hi CocInfoHighlight gui=undercurl guisp=#209020
hi CocHintHighlight gui=undercurl guisp=#204090
