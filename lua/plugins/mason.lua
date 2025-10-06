-- ============================================================================
-- Mason: LSP Server Manager
-- ============================================================================
-- Easily install and manage LSP servers, formatters, and linters
-- GitHub: https://github.com/williamboman/mason.nvim
-- LSP servers must be configured separately in lsp.lua

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",  -- Bridge between mason and lspconfig
  },
  cmd = "Mason",  -- Load on :Mason command
  keys = {
    { "<leader>m", "<cmd>Mason<CR>", desc = "Open Mason" },
  },
  config = function()
    -- Setup Mason
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Setup mason-lspconfig
    -- This bridges mason with lspconfig and ensures servers are installed
    require("mason-lspconfig").setup({
      -- List of servers to automatically install
      -- Add more servers as needed (run :Mason to see available servers)
      ensure_installed = {
        "lua_ls",     -- Lua
        "ts_ls",      -- TypeScript/JavaScript
        "pyright",    -- Python
        "rust_analyzer",  -- Rust
      },
      automatic_installation = true,  -- Automatically install servers configured in lsp.lua
    })
  end,
}
