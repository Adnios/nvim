vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_highlight_opened_files = 3
vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
-- vim.g.nvim_tree_gitignore = 1

vim.g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
   },
   folder = {
      -- disable indent_markers option to get arrows working or
      -- if you want both arrows and indent then just add the arrow icons in front
      -- ofthe default and opened folders below!
      arrow_open = "",
      arrow_closed = "",
      default = "",
      empty = "", -- 
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}
vim.cmd([[autocmd Filetype NvimTree set cursorline]])

-- https://github.com/kyazdani42/nvim-tree.lua/issues/273
-- issue for files in NTFS
vim.cmd "hi! def NvimTreeExecFile guifg=none guibg=none gui=NONE"

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require('nvim-tree').setup {
    hijack_cursor = true,
    gitignore = true,
    ignore = {'.git', 'node_modules', '.cache'},
    nvim_tree_ignore = { '.git', 'node_modules', 'dist' },
    open_on_tab = false,
    disable_netrw = true,
    hijack_netrw = true,
    -- https://github.com/kyazdani42/nvim-tree.lua/issues/960
    auto_close = false,
    update_cwd = false,
    highlight_opened_files = true,
    auto_ignore_ft = {'startify', 'dashboard'},
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {}
    },

    filters = {
        dotfiles = true,
        custom = {'.git', '.cache'}
    },
    view = {
        allow_resize = false,
        width = 30,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = true,
            -- list of mappings to set on the tree manually
            list = {
                {
                    key = {"<CR>", "o", "<2-LeftMouse>"},
                    cb = tree_cb("edit")
                },
                {key = {"<2-RightMouse>", "<C-]>"}, cb = tree_cb("cd")},
                {key = "<C-v>", cb = tree_cb("vsplit")},
                {key = "<C-x>", cb = tree_cb("split")},
                {key = "<C-t>", cb = tree_cb("tabnew")},
                {key = "<", cb = tree_cb("prev_sibling")},
                {key = ">", cb = tree_cb("next_sibling")},
                {key = "P", cb = tree_cb("parent_node")},
                {key = "<BS>", cb = tree_cb("close_node")},
                {key = "<S-CR>", cb = tree_cb("close_node")},
                {key = "<Tab>", cb = tree_cb("preview")},
                {key = "K", cb = tree_cb("first_sibling")},
                {key = "J", cb = tree_cb("last_sibling")},
                {key = "I", cb = tree_cb("toggle_ignored")},
                {key = "H", cb = tree_cb("toggle_dotfiles")},
                {key = "R", cb = tree_cb("refresh")},
                {key = "a", cb = tree_cb("create")},
                {key = "d", cb = tree_cb("remove")},
                {key = "r", cb = tree_cb("rename")},
                {key = "<C-r>", cb = tree_cb("full_rename")},
                {key = "x", cb = tree_cb("cut")},
                {key = "c", cb = tree_cb("copy")},
                {key = "p", cb = tree_cb("paste")},
                {key = "y", cb = tree_cb("copy_name")},
                {key = "Y", cb = tree_cb("copy_path")},
                {key = "gy", cb = tree_cb("copy_absolute_path")},
                {key = "[c", cb = tree_cb("prev_git_item")},
                {key = "]c", cb = tree_cb("next_git_item")},
                {key = "-", cb = tree_cb("dir_up")},
                {key = "s", cb = tree_cb("system_open")},
                {key = "q", cb = tree_cb("close")},
                {key = "g?", cb = tree_cb("toggle_help")}
            }
        }
    }
}
