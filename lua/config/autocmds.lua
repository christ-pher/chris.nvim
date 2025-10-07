-- ============================================================================
-- Autocommands
-- ============================================================================
-- Define autocommands for various events

-- Create custom highlight group for yank
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#FFFFFF", fg = "#000000" })

-- Highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
  end,
})
