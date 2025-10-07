-- ============================================================================
-- Neovim Configuration Entry Point
-- ============================================================================
-- This is the main entry point for your Neovim configuration.
-- It loads core settings and bootstraps the lazy.nvim plugin manager.

-- Set leader key before loading plugins (must be set before lazy)
vim.g.mapleader = " "        -- Space as leader key
vim.g.maplocalleader = "\\"  -- Backslash as local leader

-- Load core configuration modules
require("config.options")    -- Neovim options/settings
require("config.lazy")       -- Plugin manager bootstrap and plugin loading
require("config.keymaps")    -- Key bindings
require("config.autocmds")   -- Autocommands

-- Lazy.nvim will automatically load plugins from lua/plugins/ directory
