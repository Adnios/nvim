let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
let g:coc_disable_transparent_cursor = 1
let g:coc_global_extensions = [
            \ 'coc-pyright',
            \ 'coc-clangd',
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

" nmap <silent> [c :call CocAction('diagnosticNext')<cr>
" nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cd :CocList diagnostic<CR>
" show diagnosticinfo using <CR>
nnoremap <silent> <CR> :call CocAction('diagnosticInfo')<CR>


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references-used)
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> gA <Plug>(coc-codeaction)
nmap <silent> gl <Plug>(coc-codeaction-line)
nmap <silent> ga <Plug>(coc-codeaction-cursor)
nmap <silent> gk <Plug>(coc-fix-current)

" nmap <leader>l  <Plug>(coc-codelens-action)
nmap <leader>rf <Plug>(coc-refactor)

" Formatting selected code.
" not working for lua files
" xmap <leader>cm  <Plug>(coc-format-selected)
" nmap <leader>cm  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

nnoremap <leader>ca :<C-u>CocList -I grep<cr>
nnoremap <leader>cf :<C-u>CocList files<cr>
nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>cs :CocCommand cSpell.toggleEnableSpellChecker<CR>
nnoremap <leader>ct call CocAction('diagnosticToggle')<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
inoremap <silent><expr> <c-space> coc#refresh()

" popupmenu transparent
" set pumblend=30

" hi CocErrorHighlight gui=undercurl guisp=#902020
" hi CocWarningHighlight gui=undercurl guisp=#909020
" hi CocInfoHighlight gui=undercurl guisp=#209020
" hi CocHintHighlight gui=undercurl guisp=#204090

hi CocErrorHighlight gui=undercurl guisp=#ff0000
hi CocWarningHighlight gui=undercurl guisp=#ff922b
hi CocInfoHighlight gui=undercurl guisp=#fab005
hi CocHintHighlight gui=undercurl guisp=#15aabf
