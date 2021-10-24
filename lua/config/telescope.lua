-- if not packer_plugins['plenary.nvim'].loaded then
-- 	vim.cmd [[packadd plenary.nvim]]
-- 	vim.cmd [[packadd popup.nvim]]
-- 	vim.cmd [[packadd telescope-fzy-native.nvim]]
-- end

require('telescope').setup {
defaults = {
	prompt_prefix = '🔭 ',
	-- prompt_position = 'top',
	selection_caret = " ",
	sorting_strategy = 'ascending',
	-- preview_cutoff = 20,-- bugs when there is no preview windows
	-- results_width = 0.6,
	file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
	grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
	qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
},
extensions = {
	fzy_native = {
		override_generic_sorter = false,
		override_file_sorter = true,
	}
}
}