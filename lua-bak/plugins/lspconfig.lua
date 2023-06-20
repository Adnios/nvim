local api = vim.api
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.cmd([[packadd cmp-nvim-lsp]])
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local signs = {
  Error = " ",
  Warn = " ",
  Info = " ",
  Hint = " ",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  virtual_text = false,
  -- virtual_text = {
  --   source = true,
  -- },
})

-- Toogle diagnostics
local diagnostics_active = true
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.api.nvim_echo({ { "Show diagnostics" } }, false, {})
    vim.diagnostic.enable()
  else
    vim.api.nvim_echo({ { "Disable diagnostics" } }, false, {})
    vim.diagnostic.disable()
  end
end

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<space>l", toggle_diagnostics, bufopts)
  require('plugins.simple-diagnostics').setup({
    virtual_text = true,
    message_area = false,
    signs = true,
  })
  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-source-in-diagnostics-neovim-06-only%E2%86%B2
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()

    end
  })
  -- show diagnostics in qlist
  vim.keymap.set('n', '<leader>E', '<cmd>lua vim.diagnostic.setloclist()<CR>', bufopts)
end

-- languages server: sumneko_lua, clangd, and pyright
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { "vim", "packer_plugins" },
      },
      runtime = { version = "LuaJIT" },
      workspace = {
        library = vim.list_extend({ [vim.fn.expand("$VIMRUNTIME/lua")] = true }, {}),
      },
    },
  },
})

lspconfig.clangd.setup({
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },
})

local servers = {
  "pyright",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
  })
end
