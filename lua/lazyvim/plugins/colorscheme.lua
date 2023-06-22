return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    -- enabled = false,
    lazy = true,
    opts = { style = "moon" },
    -- config = function ()
    --   vim.cmd("colorscheme tokyonight")
    -- end
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true },
        neotest = true,
        noice = true,
        notify = true,
        nvimtree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },

  -- gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    -- enabled = false,
    priority = 1000,
    config = function ()
      vim.cmd("colorscheme gruvbox")
    end
  }
}
