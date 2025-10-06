-- ============================================================================
-- nvim-cmp: Autocompletion Engine
-- ============================================================================
-- Provides autocompletion for LSP, buffer text, paths, and more
-- GitHub: https://github.com/hrsh7th/nvim-cmp

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",  -- Load when entering insert mode
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- LSP completion source
    "hrsh7th/cmp-buffer",       -- Buffer text completion source
    "hrsh7th/cmp-path",         -- Filesystem path completion source
    "L3MON4D3/LuaSnip",         -- Snippet engine (required)
    "saadparwaiz1/cmp_luasnip", -- Snippet completion source
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      -- Snippet engine configuration (required)
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Completion window appearance
      window = {
        -- Choose your style by uncommenting one of the options below:

        -- Option 1: No border (clean, minimal)
        -- completion = {
        --   border = "none",
        --   winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
        -- },
        -- documentation = {
        --   border = "none",
        -- },

        -- Option 2: Single line border (uncomment to use)
        completion = {
          border = "single",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },
        documentation = {
          border = "single",
        },

        -- Option 3: Rounded border (uncomment to use)
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },

      -- Key mappings for completion
      mapping = cmp.mapping.preset.insert({
        -- Navigate completion menu
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        -- Scroll documentation window
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- Trigger completion manually
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Close completion menu
        ["<C-e>"] = cmp.mapping.abort(),

        -- Confirm selection
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        -- Tab/Shift-Tab to navigate and confirm
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      -- Completion sources (order determines priority)
      sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- LSP completions (highest priority)
        { name = "luasnip" },   -- Snippet completions
        { name = "path" },      -- File path completions
      }, {
        { name = "buffer" },    -- Buffer text completions (lower priority)
      }),

      -- Completion menu formatting
      formatting = {
        format = function(entry, vim_item)
          -- Kind icons (optional, can customize)
          local kind_icons = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏆",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
          }

          -- Show icon and name
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", vim_item.kind)

          -- Show source name
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]

          return vim_item
        end,
      },

      -- Experimental features
      experimental = {
        ghost_text = false,  -- Show ghost text for suggestions (can be distracting)
      },
    })
  end,
}
