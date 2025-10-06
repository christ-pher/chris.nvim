# Neovim Configuration

A clean, modular, and well-documented Neovim configuration using lazy.nvim.

## Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Plugin manager bootstrap
│   │   ├── options.lua        # Neovim settings (modify here)
│   │   └── keymaps.lua        # General keybindings (modify here)
│   └── plugins/
│       ├── autopairs.lua      # Auto-close brackets/quotes
│       ├── telescope.lua      # Fuzzy finder
│       ├── mason.lua          # LSP server installer
│       └── lsp.lua            # Native LSP configuration
```

## Key Bindings

**Leader key:** `Space`

### General
- `<Space>w` - Save file
- `<Space>q` - Quit
- `<Esc>` - Clear search highlights
- `<C-h/j/k/l>` - Navigate between windows
- `<S-h/l>` - Previous/next buffer

### Telescope (Fuzzy Finder)
- `<Space>ff` - Find files
- `<Space>fg` - Live grep (search in files)
- `<Space>fb` - Find buffers
- `<Space>fh` - Help tags
- `<Space>fr` - Recent files

### LSP (when attached to a buffer)
- `gd` - Go to definition
- `gr` - Find references
- `K` - Hover documentation
- `<Space>ca` - Code actions
- `<Space>rn` - Rename symbol
- `<Space>f` - Format buffer
- `[d` / `]d` - Previous/next diagnostic

### Mason
- `<Space>m` - Open Mason UI

## Installation

```bash
git clone https://github.com/christ-pher/chris.nvim.git ~/.config/nvim && nvim
```
