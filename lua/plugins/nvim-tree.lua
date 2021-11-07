vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

local colors = {
	bg = "#282A36",
	fg = "#F8F8F2",
	selection = "#44475A",
	comment = "#6272A4",
	red = "#FF5555",
	orange = "#FFB86C",
	yellow = "#F1FA8C",
	green = "#50fa7b",
	purple = "#BD93F9",
	cyan = "#8BE9FD",
	pink = "#FF79C6",
	bright_red = "#FF6E6E",
	bright_green = "#69FF94",
	bright_yellow = "#FFFFA5",
	bright_blue = "#D6ACFF",
	bright_magenta = "#FF92DF",
	bright_cyan = "#A4FFFF",
	bright_white = "#FFFFFF",
	menu = "#21222C",
	visual = "#3E4452",
	gutter_fg = "#4B5263",
	nontext = "#3B4048",
	white = "#ABB2BF",
	black = "#191A21"
}

local highlight = function(group, fg, bg, attr, sp)
    fg = fg and "guifg=" .. fg or "guifg=NONE"
    bg = bg and "guibg=" .. bg or "guibg=NONE"
    attr = attr and "gui=" ..attr or "gui=NONE"
	sp = sp and "guisp=" .. sp or ""

    vim.api.nvim_command("highlight " .. group .. " ".. fg .. " " .. bg .. " ".. attr .. " " .. sp)
end


highlight("NvimTreeRootFolder", colors.purple, nil, 'bold', nil)
-- highlight("NvimTreeNormal ", colors.bright_blue, nil, nil, nil)
highlight("NvimTreeGitDirty", colors.yellow, nil, nil, nil)
highlight("NvimTreeGitNew", colors.bright_green, nil, nil, nil)
-- highlight("NvimTreeImageFile", colors.pink, nil, nil, nil)
-- highlight("NvimTreeFolderIcon", colors.purple, nil, nil, nil)
-- highlight("NvimTreeIndentMarker", colors.nontext, nil, nil, nil)
-- highlight("NvimTreeEmptyFolderName", colors.comment, nil, nil, nil)
-- highlight("NvimTreeFolderName", colors.bright_blue, nil, nil, nil)
-- highlight("NvimTreeSpecialFile", colors.pink, nil, 'underline', nil)

-- vim.cmd('highlight NvimTreeRootFolder guifg=#7987A0 gui=bold')
-- vim.cmd('highlight NvimTreeRootFolder guifg=LightMagenta gui=bold,italic')
-- vim.cmd('highlight NvimTreeGitDirty guifg=#F1FA8C, gui=bold,italic')

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
      -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
      -- arrow_open = "",
      -- arrow_closed = "",
      default = "",
      empty = "", -- 
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require('nvim-tree').setup {
    gitignore = true,
    ignore = {'.git', 'node_modules', '.cache'},
    open_on_tab = false,
    disable_netrw = true,
    hijack_netrw = true,
    auto_close = true,
    update_cwd = true,
    highlight_opened_files = true,
    ignore_ft_on_setup = {'startify', 'dashboard'},
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {}
    },
    view = {
        allow_resize = true,
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
