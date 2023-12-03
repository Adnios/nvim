set clipboard& clipboard+=unnamedplus
set ignorecase
set smartcase

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup="IncSearch", timeout=200 }
augroup END

vnoremap p pgvy

nnoremap ]b <Cmd>lua require('vscode-neovim').action('workbench.action.nextEditor')<CR>
nnoremap [b <Cmd>lua require('vscode-neovim').action('workbench.action.previousEditor')<CR>

nnoremap ?? <Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { { query = vim.fn.expand('<cword>') } } })<CR>
nnoremap ? <Cmd>lua require('vscode-neovim').action('editor.action.startFindReplaceAction')<CR>

nnoremap <space>f <Cmd>lua require('vscode-neovim').action('workbench.files.action.showActiveFileInExplorer')<CR>

nnoremap ]g <Cmd>lua require('vscode-neovim').action('workbench.action.editor.nextChange')<CR>
nnoremap [g <Cmd>lua require('vscode-neovim').action('workbench.action.editor.previousChange')<CR>

" nnoremap <C-w> <Cmd>lua require('vscode-neovim').action('workbench.action.closeActiveEditor')<CR>
" xnoremap <C-w> <Cmd>lua require('vscode-neovim').action('workbench.action.closeActiveEditor')<CR>

nnoremap <space>z <Cmd>lua require('vscode-neovim').action('editor.action.toggleWordWrap')<CR>
xnoremap <space>z <Cmd>lua require('vscode-neovim').action('editor.action.toggleWordWrap')<CR>

" nnoremap [c <Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>

nnoremap <silent> <delete> <Cmd>lua require('vscode-neovim').call('editor.debug.action.toggleBreakpoint')<CR>

nnoremap <space>pp <Cmd>call VSCodeNotify('copyFilePath')<CR>
nnoremap <space>p <Cmd>call VSCodeNotify('copyRelativeFilePath')<CR>