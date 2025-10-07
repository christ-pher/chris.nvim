-- ============================================================================
-- Bufferline - Tab/Buffer bar
-- ============================================================================
-- Shows open buffers as tabs at the top of the window
-- GitHub: https://github.com/akinsho/bufferline.nvim

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle pin buffer" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
    { "<leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
  },
  opts = {
    options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      separator_style = "slant", -- "slant" | "slope" | "thick" | "thin" | "padded_slant"
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        },
      },
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      -- Show buffer numbers
      numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both"

      -- Custom filter to hide certain filetypes
      custom_filter = function(buf_number)
        -- Don't show terminal buffers in bufferline
        if vim.bo[buf_number].buftype == "terminal" then
          return false
        end
        return true
      end,
    },
  },
}
