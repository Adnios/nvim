local db = require('dashboard')
db.session_directory = vim.env.HOME .. "/.cache/nvim/session"
-- db.setup({
--   theme = 'doom',
--   config = {
--     week_header = {
--       enable = true,
--     },
--     project = {
--       enable = true,
--     },
--     disable_move = true,
--     shortcut = {
--       {
--         desc = 'Update',
--         icon = ' ',
--         group = 'Include',
--         action = 'call dein#update()',
--         key = 'u',
--       },
--       {
--         icon = ' ',
--         desc = 'Files',
--         group = 'Function',
--         action = 'Telescope find_files find_command=rg,--ignore,--hidden,--files',
--         key = 'f',
--       },
--     },
--   },
-- })

db.setup({
  theme = 'doom',
  config = {
    header = {}, --your header
    center = {
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'b',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'lua print(2)'
      },
      {
        icon = ' ',
        desc = 'Find Dotfiles',
        key = 'f',
        keymap = 'SPC f d',
        action = 'lua print(3)'
      },
    },
    footer = {}  --your footer
  }
})
