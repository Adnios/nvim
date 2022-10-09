--[[ local cmp = require('cmp')
cmp.setup({
  preselect = cmp.PreselectMode.Item,
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
  },
  -- You can set mappings if you want
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.config.disable,
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  },
}) ]]

vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "#2D2E3D" })
vim.api.nvim_set_hl(0, "CmpPmenuSel", { bg = "#42435C" })
vim.api.nvim_set_hl(0, "CmpDocBorder", { bg = "#2B2C3B" })

-- vim.cmd([[packadd cmp-tabnine]])
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local border = function(hl)
  return {
    { "╭", hl },
    { "─", hl },
    { "╮", hl },
    { "│", hl },
    { "╯", hl },
    { "─", hl },
    { "╰", hl },
    { "│", hl },
  }
end

local space_separator = function(hl) -- Only have space separator between.
  return {
    { "", hl },
    { "", hl },
    { "", hl },
    { " ", hl },
    { "", hl },
    { "", hl },
    { "", hl },
    { " ", hl },
  }
end

local cmp_window = require("cmp.utils.window")

function cmp_window:has_scrollbar()
  return false
end

local compare = require("cmp.config.compare")

local cmp = require("cmp")
cmp.setup({
  window = {
    completion = {
      -- border = border("CmpBorder"),
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpPmenuSel",
    },
    documentation = {
      border = space_separator("CmpDocBorder"),
      winhighlight = "Normal:CmpPmenu",
    },
  },
  sorting = {
    comparators = {
      -- require("cmp_tabnine.compare"),
      compare.offset,
      compare.exact,
      compare.score,
      -- require("cmp-under-comparator").under,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
  formatting = {
    format = function(entry, vim_item)
      local lspkind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
        Namespace = "",
        Table = "",
        Object = " ",
        Tag = "",
        Array = " ",
        Boolean = "",
        Number = "",
        Null = "ﳠ",
        String = "",
        Calendar = "",
        Watch = "",
        Package = "",
      }
      -- load lspkind icons
      vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)

      --[[ vim_item.menu = ({
        cmp_tabnine = "[TN]",
        buffer = "[BUF]",
        orgmode = "[ORG]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        path = "[PATH]",
        tmux = "[TMUX]",
        luasnip = "[SNIP]",
        spell = "[SPELL]",
      })[entry.source.name] ]]

      local label = vim_item.abbr
      local truncated_label = vim.fn.strcharpart(label, 0, 80)
      if truncated_label ~= label then
        vim_item.abbr = truncated_label .. "..."
      end

      return vim_item
    end,
  },
  -- You can set mappings if you want
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  -- You should specify your *installed* sources.
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "spell" },
    { name = "tmux" },
    { name = "buffer" },
  },
})
