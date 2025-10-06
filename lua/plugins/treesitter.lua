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
    -- Tip: Keep this list minimal - only include languages you use frequently
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Set to false for better performance - manually install with :TSInstall <language>
    auto_install = false,

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
    -- Disabled by default for better performance - enable if you use it
    incremental_selection = {
      enable = false,
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
