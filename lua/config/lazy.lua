-- ============================================================================
-- Lazy.nvim Plugin Manager Bootstrap
-- ============================================================================
-- This file handles the automatic installation and configuration of lazy.nvim
-- Plugins are automatically loaded from lua/plugins/*.lua

-- Bootstrap lazy.nvim installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- Setup lazy.nvim with plugin specifications
require("lazy").setup("plugins", {
  -- Configuration options for lazy.nvim
  install = {
    colorscheme = { "habamax" }, -- Fallback colorscheme during installation
  },
  checker = {
    enabled = false,  -- Don't automatically check for plugin updates
  },
  change_detection = {
    enabled = true,   -- Automatically reload on config changes
    notify = false,   -- Don't notify about config changes
  },
  performance = {
    rtp = {
      -- Disable some builtin plugins you likely don't need
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
