--[[ local saga = require("lspsaga")
saga.init_lsp_saga({
  symbol_in_winbar = {
    enable = true,
  },
}) ]]

vim.api.nvim_set_hl(0, "LspFloatWinNormal", { bg = "#1E1E2E" })
vim.api.nvim_set_hl(0, "SagaShadow", { bg = "#1E1E2E" })

local function set_sidebar_icons()
  -- Set icons for sidebar.
  local diagnostic_icons = {
    Error = " ",
    Warn = " ",
    Info = " ",
    Hint = " ",
  }
  for type, icon in pairs(diagnostic_icons) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl })
  end
end

local function get_palette()
  if vim.g.colors_name == "catppuccin" then
    -- If the colorscheme is catppuccin then use the palette.
    return require("catppuccin.palettes").get_palette()
  else
    -- Default behavior: return lspsaga's default palette.
    local palette = require("lspsaga.lspkind").colors
    palette.peach = palette.orange
    palette.flamingo = palette.orange
    palette.rosewater = palette.yellow
    palette.mauve = palette.violet
    palette.sapphire = palette.blue
    palette.maroon = palette.orange

    return palette
  end
end

set_sidebar_icons()

local colors = get_palette()

require("lspsaga").init_lsp_saga({
  border_style = "single",
  saga_winblend = 0,
  move_in_saga = { prev = "<C-j>", next = "<C-k>" },
  diagnostic_header = { " ", " ", "  ", " " },
  max_preview_lines = 15,
  code_action_icon = " ",
  code_action_num_shortcut = true,
  code_action_lightbulb = {
    enable = true,
    sign = true,
    enable_in_insert = true,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_icons = {
    def = "  ",
    ref = "諭 ",
    link = "  ",
  },
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_quit = "<C-c>",
  rename_in_select = true,
  symbol_in_winbar = {
    in_custom = false,
    enable = false,
    separator = " ",
    show_file = true,
    click_support = false,
  },
  show_outline = {
    win_position = "right",
    win_with = "_sagaoutline",
    win_width = 50,
    auto_enter = true,
    auto_preview = false,
    virt_text = "┃",
    jump_key = "o",
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  custom_kind = {
    File = { " ", colors.rosewater },
    Module = { " ", colors.blue },
    Namespace = { " ", colors.blue },
    Package = { " ", colors.blue },
    Class = { "ﴯ ", colors.yellow },
    Method = { " ", colors.blue },
    Property = { "ﰠ ", colors.teal },
    Field = { " ", colors.teal },
    Constructor = { " ", colors.sapphire },
    Enum = { " ", colors.yellow },
    Interface = { " ", colors.yellow },
    Function = { "fuck ", colors.blue },
    Variable = { " ", colors.peach },
    Constant = { " ", colors.peach },
    String = { " ", colors.green },
    Number = { " ", colors.peach },
    Boolean = { " ", colors.peach },
    Array = { " ", colors.peach },
    Object = { " ", colors.yellow },
    Key = { " ", colors.red },
    Null = { "ﳠ ", colors.yellow },
    EnumMember = { " ", colors.teal },
    Struct = { " ", colors.yellow },
    Event = { " ", colors.yellow },
    Operator = { " ", colors.sky },
    TypeParameter = { " ", colors.maroon },
    -- ccls-specific icons.
    TypeAlias = { " ", colors.green },
    Parameter = { " ", colors.blue },
    StaticMethod = { "ﴂ ", colors.peach },
    Macro = { " ", colors.red },
  },
})
