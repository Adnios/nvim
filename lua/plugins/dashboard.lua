local db = require("dashboard")
local z = require("zephyr")
db.session_directory = vim.env.HOME .. "/.cache/nvim/session"
db.preview_command = "cat | lolcat -F 0.3"
db.preview_file_path = vim.env.HOME .. "/.config/nvim/static/neovim.cat"
db.preview_file_height = 11
db.preview_file_width = 70
db.custom_center = {
  {
    icon = "  ",
    icon_hl = { fg = z.yellow },
    desc = "Recently opened files                   ",
    action = "Telescope oldfiles",
    shortcut = "SPC f h",
  },
  {
    icon = "  ",
    icon_hl = { fg = z.cyan },
    desc = "Find  File                              ",
    action = "Telescope find_files find_command=rg,--hidden,--files",
    shortcut = "SPC f f",
  },
  {
    icon = "  ",
    icon_hl = { fg = z.blue },
    desc = "File Browser                            ",
    action = "Telescope file_browser",
    shortcut = "SPC f b",
  },
  {
    icon = "  ",
    icon_hl = { fg = z.oragne },
    desc = "Find  word                              ",
    action = "Telescope live_grep",
    shortcut = "SPC f a",
  }
}
