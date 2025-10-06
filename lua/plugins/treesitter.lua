-- ============================================================================
-- Treesitter: Advanced Syntax Highlighting
-- ============================================================================
-- Provides better syntax highlighting, indentation, and code understanding
-- GitHub: https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- Automatically update parsers after install
  event = { "BufReadPost", "BufNewFile" },  -- Load when opening files
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  keys = {
    { "<leader>th", "<cmd>TSToggle highlight<CR>", desc = "Toggle Treesitter highlight" },
  },
  opts = {
    -- List of parsers to install (or "all" for all maintained parsers)
    -- Run :TSInstall <language> to install more parsers
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "typescript",
      "tsx",
      "python",
      "rust",
      "json",
      "yaml",
      "toml",
      "markdown",
      "markdown_inline",
      "html",
      "css",
      "bash",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- Highlighting configuration
    highlight = {
      enable = true,  -- Enable treesitter-based highlighting

      -- Disable for large files (performance)
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,

      -- Additional vim regex highlighting (can be disabled for performance)
      additional_vim_regex_highlighting = false,
    },

    -- Indentation based on treesitter
    indent = {
      enable = true,
    },

    -- Incremental selection based on treesitter nodes
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",    -- Start selection
        node_incremental = "<CR>",  -- Increment to next node
        scope_incremental = "<S-CR>",  -- Increment to next scope
        node_decremental = "<BS>",  -- Decrement to previous node
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
