local cmp = require('cmp')
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
})
