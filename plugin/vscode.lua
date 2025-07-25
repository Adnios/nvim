-- nice reference: https://github.com/mrbeardad/nvim
-- https://github.com/vscode-neovim/vscode-neovim/blob/68f056b4c9cb6b2559baa917f8c02166abd86f11/vim/vscode-code-actions.vim#L93-L95
-- https://github.com/vscode-neovim/vscode-neovim
-- For keymap of <C-x>, need manually add e.g.{ "key": "ctrl+6", "command": "vscode-neovim.send", "args": "<C-^>" },
if not vim.g.vscode then
  return
end

local vscode = require("vscode-neovim")
vim.cmd.syntax("off")
vim.notify = vscode.notify
vim.g.clipboard = vim.g.vscode_clipboard

-- error
-- vim.keymap.set("n", "]e", function()
--   vscode.action("editor.action.marker.nextInFiles")
--   vscode.action("closeMarkersNavigation")
-- end, { desc = "Next Error" })

-- git
vim.keymap.set("n", "]g", function()
  vscode.action("workbench.action.editor.nextChange")
  vscode.action("workbench.action.compareEditor.nextChange")
end, { desc = "Next Git Diff" })
vim.keymap.set("n", "[g", function()
  vscode.action("workbench.action.editor.previousChange")
  vscode.action("workbench.action.compareEditor.previousChange")
end, { desc = "Prev Git Diff" })

-- explorer
vim.keymap.set({ "n", "x" }, "<Leader>e", function()
  vscode.action("workbench.view.explorer")
  vscode.action("workbench.files.action.showActiveFileInExplorer")
end, { desc = "search" })


-- file
vim.keymap.set({ "n", "x" }, "<Leader><Leader>", function()
  vscode.action("workbench.action.quickOpen")
  vscode.action("workbench.action.quickOpenNavigateNext")
end, { desc = "search" })

vim.keymap.set({ "n", "x" }, "<Leader>b", function()
  vscode.action("workbench.action.showAllEditorsByMostRecentlyUsed")
  vscode.action("workbench.action.quickOpenNavigateNext")
end, { desc = "Open Recent" })

vim.keymap.set({ "n", "x" }, "<Leader>;", function()
  vscode.action("workbench.action.quickTextSearch")
end, { desc = "text search" })

-- search
vim.keymap.set(
  "n",
  "<Leader>ff",
  [[<Cmd>call VSCodeNotify('editor.actions.findWithArgs', { 'searchString': expand('<cword>'), 'replaceString': '' })<CR>]],
  { noremap = true, silent = true }
)

vim.keymap.set("x", "<Leader>ff", function()
  vscode.action('editor.action.startFindReplaceAction')
end, { desc = "find" })

vim.keymap.set("n", "<Leader>fw", function()
  vscode.action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })
end, { desc = "findInFiles" })
vim.keymap.set("x", "<Leader>fw", function()
  vscode.action('workbench.action.findInFiles')
end, { desc = "findInFiles" })

-- fold
vim.keymap.set("n", "zc", function() vscode.action("editor.fold") end, { silent = true })
vim.keymap.set("n", "zC", function() vscode.action("editor.foldRecursively") end, { silent = true })
vim.keymap.set("n", "zo", function() vscode.action("editor.unfold") end, { silent = true })
vim.keymap.set("n", "zO", function() vscode.action("editor.unfoldRecursively") end, { silent = true })
vim.keymap.set("n", "za", function() vscode.action("editor.toggleFold") end, { silent = true })
vim.keymap.set("n", "zm", function() vscode.action("editor.foldAll") end, { silent = true })
vim.keymap.set("n", "zr", function() vscode.action("editor.unfoldAll") end, { silent = true })

-- code
-- send command to terminal
-- vim.keymap.set("n", "<cr><cr>", function()
--   -- vscode.action("workbench.action.terminal.new")
--   -- vscode.action("workbench.action.toggleMaximizedPanel")
--   vscode.action("workbench.action.terminal.focus")
--   vscode.action("workbench.action.terminal.sendSequence", {
--     args = { text = "!!\n\n" },
--   })
-- end, { desc = "run last cmdline in terminal" })

-- vim has built-in support for trimming whiteLeader, but it doesn't work with vscode-neovim
-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--   pattern = "*",
--   command = [[lua require('vscode-neovim').call('editor.action.trimTrailingWhiteLeader')]],
-- })

vim.keymap.set('n', '<Leader>s', function()
  vscode.action('workbench.action.gotoSymbol')
end)

-- escape and clear hlsearch
-- vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true })
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR><Esc>", { desc = "Clear Highlight" })

-- TODO: https://github.com/Old-Farmer/dotfiles/blob/fb185f0a5fce7db8d57d30971f1a961325ee21cf/.config/vscode_neovim/init.lua#L194
-- clangd
vim.keymap.set("n", "ch", function()
  vscode.action("clangd.switchheadersource")
end)

vim.keymap.set("n", "ck", function()
  vscode.action("clangd.inlayHints.toggle")
end)

vim.keymap.set("n", "cn", function()
  vscode.action('editor.action.rename')
end, { desc = "symbol rename" })


-- keymaps
-- vim.keymap.set({ "n", "x" }, "j", function()
--   if vim.v.count == 0 then
--     vim.cmd("normal gj") -- vscode's gj
--   else
--     vim.cmd(string.format("normal! %dj", vim.v.count))
--   end
-- end, { desc = "Down" })
-- vim.keymap.set({ "n", "x" }, "k", function()
--   if vim.v.count == 0 then
--     vim.cmd("normal gk") -- vscode's gk
--   else
--     vim.cmd(string.format("normal! %dk", vim.v.count))
--   end
-- end, { desc = "Down" })

vim.keymap.set({ "n" }, "j", "<Plug>(accelerated_jk_gj)", { nowait = true, silent = true })
vim.keymap.set({ "n" }, "k", "<Plug>(accelerated_jk_gk)", { nowait = true, silent = true })

-- ctrl+tab
vim.keymap.set({ "n", "x" }, "<Leader>j", function()
  vscode.action("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
end, { desc = "ctrl+tab" })

vim.keymap.set({ "n", "x" }, "<Leader>k", function()
  vscode.action("workbench.action.quickOpenLeastRecentlyUsedEditorInGroup")
end, { desc = "ctrl+shift+tab" })

vim.keymap.set({ "n", "x" }, "<C-^>", function()
  vscode.action("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
  vscode.action("list.select")
end, { desc = "ctrl+^" })


-- vim.keymap.set('n', '<Leader>t', function()
--   vscode.eval_async([[
--     if (vscode.window.tabGroups.activeTabGroup.activeTab.isPinned) {
--       await vscode.commands.executeCommand('workbench.action.unpinEditor');
--     } else {
--         await vscode.commands.executeCommand('workbench.action.pinEditor');
--     }
--   ]])
-- end)
