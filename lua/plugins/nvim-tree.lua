-- ============================================================================
-- Nvim-Tree: File Explorer
-- ============================================================================
-- VSCode-like file explorer for Neovim
-- GitHub: https://github.com/nvim-tree/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",  -- File icons
  },
  cmd = { "NvimTreeToggle" },
  keys = {
    { "<leader>n", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
  },
  opts = {
    -- Disable netrw (vim's default file explorer)
    disable_netrw = true,
    hijack_netrw = true,

    -- Open tree on startup for directories
    hijack_directories = {
      enable = true,
    },

    -- Update focused file when changing buffers
    update_focused_file = {
      enable = true,
      update_root = false,  -- Don't change root when file changes
    },

    -- View settings
    view = {
      width = 30,
      side = "left",
      number = false,
      relativenumber = false,
    },

    -- Renderer settings
    renderer = {
      highlight_git = true,
      highlight_opened_files = "name",
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },

    -- Filters
    filters = {
      dotfiles = false,  -- Show hidden files
      custom = { "^.git$" },  -- Hide .git folder
    },

    -- Git integration
    git = {
      enable = true,
      ignore = false,  -- Show files in .gitignore
    },

    -- Actions
    actions = {
      open_file = {
        quit_on_open = false,  -- Keep tree open when opening file
        resize_window = true,
        window_picker = {
          enable = true,
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}
