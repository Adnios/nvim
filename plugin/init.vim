let g:mapleader="\<space>"
let g:maplocalleader="\<space>"

set clipboard& clipboard+=unnamedplus
set number
set ignorecase
set smartcase
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set nohlsearch

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup="IncSearch", timeout=300 }
augroup END

autocmd! TextYankPost * call feedkeys("\<Cmd>noh\<cr>" , 'n')
autocmd! InsertEnter * call feedkeys("\<Cmd>noh\<cr>" , 'n')

vnoremap p pgvy
vnoremap $ $h

nnoremap ]b <Cmd>lua require('vscode-neovim').action('workbench.action.nextEditor')<CR>
nnoremap [b <Cmd>lua require('vscode-neovim').action('workbench.action.previousEditor')<CR>

nnoremap ?? <Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { { query = vim.fn.expand('<cword>') } } })<CR>
vnoremap ?? <Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles')<CR>
nnoremap ? <Cmd>lua require('vscode-neovim').action('editor.actions.findWithArgs')<CR>
vnoremap ? <Cmd>lua require('vscode-neovim').action('editor.action.startFindReplaceAction')<CR>
nnoremap <leader>s <Cmd>lua require('vscode-neovim').action('workbench.action.gotoSymbol')<CR>

nnoremap ]g <Cmd>lua require('vscode-neovim').action('workbench.action.editor.nextChange')<CR>
nnoremap [g <Cmd>lua require('vscode-neovim').action('workbench.action.editor.previousChange')<CR>

" nnoremap <C-w> <Cmd>lua require('vscode-neovim').action('workbench.action.closeActiveEditor')<CR>
" xnoremap <C-w> <Cmd>lua require('vscode-neovim').action('workbench.action.closeActiveEditor')<CR>

nnoremap <leader>z <Cmd>lua require('vscode-neovim').action('editor.action.toggleWordWrap')<CR>
xnoremap <leader>z <Cmd>lua require('vscode-neovim').action('editor.action.toggleWordWrap')<CR>

" nnoremap [c <Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>

nnoremap <silent> <delete> <Cmd>lua require('vscode-neovim').call('editor.debug.action.toggleBreakpoint')<CR>

" [ also send to vscode
" https://github.com/vscode-neovim/vscode-neovim/blob/f875e23190fa7a7187d7c1148838795e37cf30e8/package.json
nnoremap <leader>f <cmd>call VSCodeNotify('workbench.action.quickOpenPreviousEditor')<cr>
" nnoremap <leader><leader> <cmd>call VSCodeNotify('workbench.action.showAllEditorsByMostRecentlyUsed')<cr>
nnoremap <leader><leader> <cmd>call VSCodeNotify('multiCommand.showbuffer')<cr>
nnoremap <leader>b <cmd>call VSCodeNotify('workbench.action.quickOpenPreviousRecentlyUsedEditor')<cr>
nnoremap <leader>rq <cmd>call VSCodeNotify('workbench.action.openView')<cr>
" nnoremap <leader>qq <cmd>call VSCodeNotify('workbench.action.quickOpenView')<cr>
nnoremap <leader>rr <cmd>call VSCodeNotify('workbench.action.openRecent')<cr>
nnoremap <leader>rw <cmd>call VSCodeNotify('workbench.action.reloadWindow')<cr>
" not working when vscode opened without explorer
nnoremap <leader>e <Cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>
" nnoremap <leader>e <cmd>call VSCodeNotify('workbench.explorer.fileView.focus')<cr>
" nnoremap <leader>g <cmd>call VSCodeNotify('workbench.view.scm')<cr>

nnoremap <leader>pp <Cmd>call VSCodeNotify('copyFilePath')<CR>
nnoremap <leader>pr <Cmd>call VSCodeNotify('copyRelativeFilePath')<CR>

" windows
nnoremap <leader>ww <cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
nnoremap <leader>q <cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
nnoremap <leader>wa <cmd>call VSCodeNotify('workbench.action.closeAllEditors')<cr>
nnoremap <leader>wo <cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<cr>
nnoremap <leader>wk <cmd>call VSCodeNotify('workbench.action.pinEditor')<cr>
nnoremap <leader>wK <cmd>call VSCodeNotify('workbench.action.unpinEditor')<cr>
" ]

nnoremap <leader>mm <cmd>call VSCodeNotify('editor.action.formatDocument')<CR>
vnoremap <leader>mm <cmd>call VSCodeNotifyVisual('editor.action.formatSelection')<CR>

nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

" cannot nnoremap see https://github.com/vscode-neovim/vscode-neovim/issues/259
" nmap j gj
" nmap k gk
" not working
" vmap j gj
" vmap k gk

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)