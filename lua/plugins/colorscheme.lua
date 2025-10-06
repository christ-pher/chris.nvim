-- ============================================================================
-- Colorscheme Configuration
-- ============================================================================
-- Choose and configure your preferred colorscheme
-- Uncomment ONE colorscheme option below

return {
  -- Option 1: Gruvdark (active)
  {
    "darianmorat/gruvdark.nvim",
    priority = 1000,  -- Load before other plugins
    config = function()
      vim.cmd.colorscheme("gruvdark")
    end,
  },

  -- Option 2: Catppuccin (uncomment to use)
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "mocha",  -- latte, frappe, macchiato, mocha
  --       transparent_background = false,
  --     })
  --     vim.cmd.colorscheme("catppuccin")
  --   end,
  -- },

  -- Option 3: TokyoNight (uncomment to use)
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "night",  -- storm, night, moon, day
  --       transparent = false,
  --     })
  --     vim.cmd.colorscheme("tokyonight")
  --   end,
  -- },

  -- Option 4: Gruvbox (uncomment to use)
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       transparent_mode = false,
  --     })
  --     vim.cmd.colorscheme("gruvbox")
  --   end,
  -- },

  -- Option 5: Kanagawa (uncomment to use)
  -- {
  --   "rebelot/kanagawa.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("kanagawa").setup({
  --       transparent = false,
  --     })
  --     vim.cmd.colorscheme("kanagawa")
  --   end,
  -- },

  -- Option 6: Nord (uncomment to use)
  -- {
  --   "shaunsingh/nord.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("nord")
  --   end,
  -- },

  -- Option 7: Rose Pine (uncomment to use)
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   priority = 1000,
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "main",  -- main, moon, dawn
  --     })
  --     vim.cmd.colorscheme("rose-pine")
  --   end,
  -- },

  -- Option 8: Nightfox (uncomment to use)
  -- {
  --   "EdenEast/nightfox.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("nightfox")  -- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
  --   end,
  -- },
}
