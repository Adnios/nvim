-- if not packer_plugins['plenary.nvim'].loaded then
-- 	vim.cmd [[packadd plenary.nvim]]
-- 	vim.cmd [[packadd popup.nvim]]
-- 	vim.cmd [[packadd telescope-fzy-native.nvim]]
-- end
local fb_actions = require('telescope').extensions.file_browser.actions
require('telescope').setup {
  defaults = {
    prompt_prefix = '🔭 ',
    prompt_position = 'top',
    selection_caret = " ",
    sorting_strategy = 'ascending',
    layout_config = {
      horizontal = { prompt_position = 'top', results_width = 0.6 },
      vertical = { mirror = false },
    },
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    file_browser = {
      mappings = {
        ['n'] = {
          ['a'] = fb_actions.create,
          ['r'] = fb_actions.rename,
          ['d'] = fb_actions.remove,
          ['o'] = fb_actions.open,
          ['u'] = fb_actions.goto_parent_dir,
        },
      },
    },
  },
}
require('telescope').load_extension('fzy_native')
require("telescope").load_extension('file_browser')
