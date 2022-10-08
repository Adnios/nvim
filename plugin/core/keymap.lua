vim.api.nvim_set_keymap(
	"n",
	"<Leader>ff",
	"<cmd>Telescope find_files find_command=rg,--hidden,--files<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>.",
	"<cmd>Telescope find_files find_command=rg,--hidden,--files<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<Leader>fb", "<cmd>Telescope file_browser<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>,", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fa", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fw", "<cmd>Telescope grep_string<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fh", "<cmd>DashboardFindHistory<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fr", "<cmd>Telescope resume<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fp", "<cmd>Telescope pickers<CR>", { noremap = true, silent = true })
