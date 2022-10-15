local ls = require('luasnip')
ls.config.set_config({
  history = false,
  updateevents = 'TextChanged,TextChangedI',
})
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_vscode').lazy_load({
  paths = { './snippets/' },
})
