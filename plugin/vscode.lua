-- nice reference: https://github.com/mrbeardad/nvim
-- https://github.com/vscode-neovim/vscode-neovim
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

-- file
vim.keymap.set({"n", "x"}, "<space><space>", function()
  vscode.action("workbench.action.quickOpen")
  vscode.action("workbench.action.quickOpenNavigateNext")
end, { desc = "search" })

vim.keymap.set({"n", "x"}, "<space>b", function()
  vscode.action("workbench.action.showAllEditorsByMostRecentlyUsed")
  vscode.action("workbench.action.quickOpenNavigateNext")
end, { desc = "Open Recent" })

-- search
vim.keymap.set("n", "<space>/", function()
  vscode.action('editor.actions.findWithArgs')
end, { desc = "find"})
vim.keymap.set("x", "<space>/", function()
  vscode.action('editor.action.startFindReplaceAction')
end, { desc = "find"})
vim.keymap.set("n", "<space>?", function()
  vscode.action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })
end, { desc = "findInFiles"})
vim.keymap.set("x", "<space>?", function()
  vscode.action('workbench.action.findInFiles')
end, { desc = "findInFiles"})

-- fold
vim.keymap.set("n", "zc", function() vscode.action("editor.fold") end, { silent = true })
vim.keymap.set("n", "zC", function() vscode.action("editor.foldRecursively") end, { silent = true })
vim.keymap.set("n", "zo", function() vscode.action("editor.unfold") end, { silent = true })
vim.keymap.set("n", "zO", function() vscode.action("editor.unfoldRecursively") end, { silent = true })
vim.keymap.set("n", "za", function() vscode.action("editor.toggleFold") end, { silent = true })
vim.keymap.set("n", "zm", function() vscode.action("editor.foldAll") end, { silent = true })
vim.keymap.set("n", "zr", function() vscode.action("editor.unfoldAll") end, { silent = true })

-- send command to terminal
vim.keymap.set("n", "<cr><cr>", function()
  -- vscode.action("workbench.action.terminal.new")
  -- vscode.action("workbench.action.toggleMaximizedPanel")
  vscode.action("workbench.action.terminal.focus")
  vscode.action("workbench.action.terminal.sendSequence", {
    args = { text = "!!\n\n" },
  })
end, { desc = "run last cmdline in terminal" })

