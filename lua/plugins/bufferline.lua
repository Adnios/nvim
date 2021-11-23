require('bufferline').setup {
  options = {
    right_mouse_command = 'vert sbuffer %d',
    show_close_icon = false,
    ---based on https://github.com/kovidgoyal/kitty/issues/957
    -- separator_style = os.getenv 'KITTY_WINDOW_ID' and 'slant' or 'padded_slant',
    -- diagnostics = 'coc',
    -- diagnostics_indicator = diagnostics_indicator,
    -- custom_filter = custom_filter,
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'Explorer',
        -- highlight = 'PanelHeading',
        highlight = 'Directory',
        -- padding = 1,
      },
      {
        filetype = 'DiffviewFiles',
        text = 'Diff View',
        -- highlight = 'PanelHeading',
        highlight = 'Directory',
        -- padding = 1,
      },
    },
  },
}

-- gb has been used by comment
vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>BufferLinePick<CR>', { noremap = true, silent = true })
