-- ============================================================================
-- Which-Key: Keybinding Helper
-- ============================================================================
-- Shows available keybindings in a popup as you type
-- GitHub: https://github.com/folke/which-key.nvim

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- Popup settings
    preset = "modern",
    delay = 300,  -- Delay before showing the popup (ms)

    -- Window settings
    win = {
      border = "rounded",
      padding = { 1, 2 },
    },

    -- Icon settings
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },

    -- Disable which-key for certain modes
    disable = {
      ft = {},  -- Filetypes to disable which-key
      bt = {},  -- Buffer types to disable which-key
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Register key groups and descriptions
    wk.add({
      -- File operations
      { "<leader>f", group = "Find" },
      { "<leader>ff", desc = "Find files" },
      { "<leader>fg", desc = "Live grep" },
      { "<leader>fb", desc = "Find buffers" },
      { "<leader>fh", desc = "Help tags" },
      { "<leader>fr", desc = "Recent files" },
      { "<leader>fd", desc = "Find diagnostics" },
      { "<leader>fs", desc = "Document symbols" },

      -- Code/LSP operations
      { "<leader>c", group = "Code" },
      { "<leader>ca", desc = "Code action" },

      -- Diagnostics
      { "<leader>d", group = "Diagnostics" },
      { "<leader>dl", desc = "Diagnostic list" },

      -- General operations
      { "<leader>w", desc = "Save file" },
      { "<leader>q", desc = "Quit" },
      { "<leader>n", desc = "Toggle file explorer" },
      { "<leader>t", desc = "Vertical terminal split" },
      { "<leader>T", desc = "Horizontal terminal split" },
      { "<leader>e", desc = "Show diagnostic" },
      { "<leader>k", desc = "Signature help" },
      { "<leader>rn", desc = "Rename symbol" },
      { "<leader>F", desc = "Format buffer" },
      { "<leader>/", desc = "Toggle comment line" },

      -- Buffer operations
      { "<leader>b", group = "Buffer" },
      { "<leader>bd", desc = "Delete buffer" },
      { "<leader>bp", desc = "Toggle pin buffer" },
      { "<leader>bP", desc = "Delete non-pinned buffers" },
      { "<leader>bo", desc = "Delete other buffers" },
      { "<leader>br", desc = "Delete buffers to the right" },
      { "<leader>bl", desc = "Delete buffers to the left" },

      -- Visual mode
      { "<leader>c", desc = "Code action", mode = "v" },
      { "<leader>/", desc = "Toggle comment", mode = "v" },

      -- Comment keybinds
      { "gc", group = "Comment" },
      { "gcc", desc = "Toggle comment line" },
      { "gbc", desc = "Toggle block comment" },
      { "gcO", desc = "Comment line above" },
      { "gco", desc = "Comment line below" },
      { "gcA", desc = "Comment end of line" },
      { "gc", desc = "Comment", mode = "v" },
      { "gb", desc = "Block comment", mode = "v" },
    })
  end,
}
