local fn = vim.fn
local groups = require 'bufferline.groups'
require('bufferline').setup {
  options = {
    right_mouse_command = 'vert sbuffer %d',
    show_close_icon = false,
    ---based on https://github.com/kovidgoyal/kitty/issues/957
    separator_style = os.getenv 'KITTY_WINDOW_ID' and 'slant' or 'padded_slant',
    diagnostics = 'coc',
    -- diagnostics_indicator = diagnostics_indicator,
    -- custom_filter = custom_filter,
    offsets = {
      {
        filetype = 'undotree',
        text = 'Undotree',
        highlight = 'PanelHeading',
        padding = 1,
      },
      {
        filetype = 'NvimTree',
        text = 'Explorer',
        highlight = 'PanelHeading',
        padding = 1,
      },
      {
        filetype = 'DiffviewFiles',
        text = 'Diff View',
        highlight = 'PanelHeading',
        padding = 1,
      },
      {
        filetype = 'flutterToolsOutline',
        text = 'Flutter Outline',
        highlight = 'PanelHeading',
      },
      {
        filetype = 'packer',
        text = 'Packer',
        highlight = 'PanelHeading',
        padding = 1,
      },
    },
    groups = {
      options = {
        toggle_hidden_on_enter = true,
      },
      items = {
        groups.builtin.ungrouped,
        {
          highlight = { guisp = '#51AFEF', gui = 'underline' },
          name = 'tests',
          icon = '',
          matcher = function(buf)
            return buf.filename:match '_spec' or buf.filename:match 'test'
          end,
        },
        {
          name = 'view models',
          highlight = { guisp = '#03589C', gui = 'underline' },
          matcher = function(buf)
            return buf.filename:match 'view_model%.dart'
          end,
        },
        {
          name = 'screens',
          matcher = function(buf)
            return buf.path:match 'screen'
          end,
        },
        {
          highlight = { guisp = '#C678DD', gui = 'underline' },
          name = 'docs',
          matcher = function(buf)
            for _, ext in ipairs { 'md', 'txt', 'org', 'norg', 'wiki' } do
              if ext == fn.fnamemodify(buf.path, ':e') then
                return true
              end
            end
          end,
        },
      },
    },
  },
}
