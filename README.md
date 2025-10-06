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

## First Launch

1. Start Neovim: `nvim`
2. Lazy.nvim will auto-install and download plugins
3. Run `:Mason` to see installed LSP servers
4. LSP servers will auto-install for configured languages

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

## Customization

### Add/Remove Neovim Settings
Edit: `lua/config/options.lua`

### Add/Remove Keybindings
Edit: `lua/config/keymaps.lua`

### Add LSP Servers
1. Edit `lua/plugins/mason.lua` - Add server to `ensure_installed` list
2. Edit `lua/plugins/lsp.lua` - Add server configuration
3. Run `:Mason` to verify installation

### Add New Plugins
Create a new file in `lua/plugins/` (e.g., `lua/plugins/myplugin.lua`):

```lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

Lazy.nvim auto-loads all files from the `lua/plugins/` directory.

## Requirements

- Neovim 0.11.x or newer
- Git (for plugin management)
- Ripgrep (for Telescope live_grep): `sudo apt install ripgrep` or `brew install ripgrep`
- Language-specific tools (installed via Mason)

## Troubleshooting

- Check plugin status: `:Lazy`
- Check LSP status: `:LspInfo`
- Check Mason installations: `:Mason`
- View logs: `:messages`
