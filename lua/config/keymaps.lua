-- ============================================================================
-- Key Mappings
-- ============================================================================
-- Add or modify keybindings here. Plugin-specific keybindings are in their
-- respective plugin files in lua/plugins/

local map = vim.keymap.set

-- ============================================================================
-- General Keybindings
-- ============================================================================

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows with arrows
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move lines up/down
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Save and quit
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Better paste in visual mode (doesn't overwrite clipboard)
map("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Terminal splitting
map("n", "<leader>t", "<cmd>vsplit term<CR>", { desc = "Vertical terminal split" })
map("n", "<leader>T", "<cmd>split | terminal<CR><C-w>J<cmd>resize 15<CR>", { desc = "Horizontal terminal split" })

-- Terminal mode navigation (Ctrl+hjkl to switch windows from terminal)
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to left window from terminal" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to bottom window from terminal" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to top window from terminal" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to right window from terminal" })

-- Exit terminal mode with Esc
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
