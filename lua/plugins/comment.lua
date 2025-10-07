-- ============================================================================
-- Comment Plugin
-- ============================================================================
-- Smart and powerful commenting plugin
-- GitHub: https://github.com/numToStr/Comment.nvim

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },  -- Load when opening a file
  keys = {
    { "<leader>/", "gcc", desc = "Toggle comment line", remap = true },
    { "<leader>/", "gc", desc = "Toggle comment", mode = "v", remap = true },
  },
  config = function()
    require("Comment").setup({
      -- Add a space between comment and the line
      padding = true,
      -- Whether the cursor should stay at its position
      sticky = true,
      -- Lines to be ignored while (un)comment
      ignore = "^$",  -- Ignore empty lines
      -- LHS of toggle mappings in NORMAL mode
      toggler = {
        line = "gcc",  -- Line-comment toggle keymap
        block = "gbc", -- Block-comment toggle keymap
      },
      -- LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        line = "gc",  -- Line-comment keymap
        block = "gb", -- Block-comment keymap
      },
      -- LHS of extra mappings
      extra = {
        above = "gcO", -- Add comment on the line above
        below = "gco", -- Add comment on the line below
        eol = "gcA",   -- Add comment at the end of line
      },
      -- Enable keybindings
      mappings = {
        basic = true,    -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        extra = true,    -- Extra mapping; `gco`, `gcO`, `gcA`
      },
    })
  end,
}
