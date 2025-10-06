-- ============================================================================
-- Neovim Options and Settings
-- ============================================================================
-- Customize these settings to fit your preferences

local opt = vim.opt

-- Line numbers
opt.number = true          -- Show line numbers
opt.relativenumber = true  -- Show relative line numbers

-- Indentation
opt.tabstop = 2           -- Number of spaces a tab counts for
opt.shiftwidth = 2        -- Number of spaces for auto-indent
opt.expandtab = true      -- Use spaces instead of tabs
opt.autoindent = true     -- Copy indent from current line when starting new line
opt.smartindent = true    -- Smart autoindenting when starting a new line

-- Search
opt.ignorecase = true     -- Ignore case in search patterns
opt.smartcase = true      -- Override ignorecase if search contains uppercase
opt.hlsearch = true       -- Highlight search matches
opt.incsearch = true      -- Show search matches as you type

-- UI
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.signcolumn = "yes"    -- Always show sign column (prevents text shifting)
opt.cursorline = true     -- Highlight current line
opt.scrolloff = 8         -- Keep 8 lines above/below cursor when scrolling
opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor when scrolling
opt.wrap = false          -- Don't wrap lines

-- Behavior
opt.mouse = "a"           -- Enable mouse support in all modes
opt.clipboard = "unnamedplus"  -- Use system clipboard
opt.undofile = true       -- Enable persistent undo
opt.backup = false        -- Don't create backup files
opt.swapfile = false      -- Don't create swap files
opt.updatetime = 250      -- Faster completion (default 4000ms)
opt.timeoutlen = 300      -- Time to wait for mapped sequence (default 1000ms)

-- Splits
opt.splitright = true     -- Vertical splits go to the right
opt.splitbelow = true     -- Horizontal splits go below

-- Completion
opt.completeopt = "menu,menuone,noselect"  -- Better completion experience
