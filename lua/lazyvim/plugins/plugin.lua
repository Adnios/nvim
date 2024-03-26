return {
  {
    "rhysd/accelerated-jk"
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = false
        },
        char = {
          -- highlight = { backdrop = false },
        }
      },
      label = {
        after = false, ---@type boolean|number[]
        before = true, ---@type boolean|number[]
      },
      highlight = {
        -- backdrop = false,
      },
    },
    -- stylua: ignore
    keys = {
      { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S",    mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      -- { "r",    mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      -- { "R",    mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<cr>", mode = { "c" },           function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
    -- config cause label before not working
    init = function()
      vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#a2aeb0", bg = "#282c34", italic = true, bold = true })
    end,
  }
}
