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

vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files find_command=rg,--hidden,--files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>.', '<cmd>Telescope find_files find_command=rg,--hidden,--files<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>Telescope file_browser<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>bb', '<cmd>Telescope buffers<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>,', '<cmd>Telescope buffers<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>fa', '<cmd>DashboardFindWord<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>fw', '<cmd>Telescope grep_string<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>DashboardFindHistory<CR>', {noremap = true, silent = true})
