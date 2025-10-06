-- ============================================================================
-- Telescope Fuzzy Finder
-- ============================================================================
-- Powerful fuzzy finder for files, buffers, grep, and more
-- GitHub: https://github.com/nvim-telescope/telescope.nvim

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- Required dependency
  },
  cmd = "Telescope",  -- Load on :Telescope command
  keys = {
    -- File pickers
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },

    -- LSP pickers (useful when LSP is active)
    { "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Find diagnostics" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
  },
  opts = {
    defaults = {
      -- Default configuration for telescope
      prompt_prefix = "🔍 ",
      selection_caret = "➜ ",
      path_display = { "truncate" },  -- Truncate long paths

      mappings = {
        i = {
          -- Insert mode mappings
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
          ["<C-q>"] = "send_selected_to_qflist",
        },
        n = {
          -- Normal mode mappings
          ["q"] = "close",
        },
      },
    },
    pickers = {
      -- Individual picker configurations
      find_files = {
        hidden = true,  -- Show hidden files
        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
      },
    },
  },
}
