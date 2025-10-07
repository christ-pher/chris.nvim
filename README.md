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

## Installation

### Prerequisites

**Required:**
- **Neovim 0.11.x or higher** - `nvim --version` to check
- **Git** - For plugin management
- **curl** or **wget** - For downloading plugins
- **ripgrep (rg)** - For Telescope fuzzy finding
  - Ubuntu/Debian: `sudo apt install ripgrep`
  - Fedora: `sudo dnf install ripgrep`
  - macOS: `brew install ripgrep`
  - Arch: `sudo pacman -S ripgrep`

**Optional (for LSP support):**
- **Node.js and npm** - For TypeScript/JavaScript LSP
  - `curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -`
  - `sudo apt install nodejs`
- **Python 3** - For Python LSP
  - `sudo apt install python3 python3-pip`
- **Rust and Cargo** - For Rust LSP
  - `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

### Install Configuration

```bash
git clone https://github.com/christ-pher/chris.nvim.git ~/.config/nvim && nvim
```

The first time you open Neovim, lazy.nvim will automatically install all plugins. LSP servers will be installed automatically by Mason.

## Font Setup

This configuration uses icons from Nerd Fonts. You need to install a Nerd Font on your **local machine** (not the server if you SSH).

### macOS

```bash
# Install using Homebrew
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

Then configure your terminal app (Terminal.app, iTerm2, etc.) to use "JetBrainsMono Nerd Font".

### Windows

1. Download from https://github.com/ryanoasis/nerd-fonts/releases
2. Extract and install the `.ttf` files (right-click → Install)
3. Configure your terminal to use the Nerd Font

**For Windows Terminal**, edit settings.json:
```json
{
  "profiles": {
    "defaults": {
      "font": {
        "face": "JetBrainsMono Nerd Font"
      }
    }
  }
}
```

### Linux (Desktop)

```bash
# Create fonts directory
mkdir -p ~/.local/share/fonts

# Download JetBrains Mono Nerd Font
cd ~/.local/share/fonts
curl -fLo "JetBrains Mono Nerd Font Complete.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf

# Refresh font cache
fc-cache -fv
```

Then configure your terminal emulator to use "JetBrainsMono Nerd Font".

## Key Bindings

**Leader key:** `Space`

### General
- `<Space>w` - Save file
- `<Space>q` - Quit
- `<Esc>` - Clear search highlights
- `<C-h/j/k/l>` - Navigate between windows
- `<C-Up/Down/Left/Right>` - Resize windows
- `<S-h/l>` - Previous/next buffer
- `<Tab>` / `<S-Tab>` - Next/previous buffer
- `<A-j/k>` - Move line/selection up/down
- `<` / `>` (visual) - Indent left/right and reselect

### File Explorer
- `<Space>n` - Toggle file explorer (nvim-tree)

### Terminal
- `<Space>t` - Open vertical terminal split
- `<Space>T` - Open horizontal terminal split
- `<Esc><Esc>` (in terminal) - Exit terminal mode
- `<C-h/j/k/l>` (in terminal) - Navigate to windows from terminal

### Telescope (Fuzzy Finder)
- `<Space>ff` - Find files
- `<Space>fg` - Live grep (search in files)
- `<Space>fb` - Find buffers
- `<Space>fh` - Help tags
- `<Space>fr` - Recent files
- `<Space>f/` - Find in current buffer
- `<Space>fd` - Find diagnostics
- `<Space>fs` - Document symbols

### LSP (when attached to a buffer)
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gr` - Find references
- `gt` - Go to type definition
- `K` - Hover documentation
- `<Space>k` - Signature help
- `<Space>ca` - Code actions
- `<Space>rn` - Rename symbol
- `<Space>F` - Format buffer
- `<Space>tf` - Toggle format on save
- `[d` / `]d` - Previous/next diagnostic
- `<Space>e` - Show diagnostic in floating window
- `<Space>dl` - Show diagnostic list

### Buffer Management
- `<Space>bd` - Delete current buffer
- `<Space>bp` - Toggle pin buffer
- `<Space>bP` - Delete non-pinned buffers
- `<Space>bo` - Delete other buffers
- `<Space>br` - Delete buffers to the right
- `<Space>bl` - Delete buffers to the left

### Mason (LSP Server Manager)
- `<Space>m` - Open Mason UI

## Customization

- **General settings**: Edit `lua/config/options.lua`
- **Keybindings**: Edit `lua/config/keymaps.lua`
- **Plugin configs**: Edit files in `lua/plugins/`
- **Add new plugins**: Create new files in `lua/plugins/` following the lazy.nvim spec
