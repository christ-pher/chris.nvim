-- ============================================================================
-- Native Neovim LSP Configuration (0.11.x)
-- ============================================================================
-- Uses the new vim.lsp.config() API introduced in Neovim 0.11
-- See :help lspconfig-nvim-0.11

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },  -- Load when opening files
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",  -- LSP completion capabilities
  },
  config = function()
    -- ========================================================================
    -- LSP Keybindings
    -- ========================================================================
    -- These keybindings are set when an LSP server attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        local map = vim.keymap.set

        -- Navigation
        map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
        map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
        map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
        map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Find references" }))
        map("n", "gt", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))

        -- Documentation
        map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
        map("n", "<leader>k", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))

        -- Actions
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
        map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
        map("n", "<leader>F", function()
          vim.lsp.buf.format({ async = true })
        end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))

        -- Diagnostics
        map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
        map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
        map("n", "<leader>e", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
        map("n", "<leader>dl", vim.diagnostic.setloclist, vim.tbl_extend("force", opts, { desc = "Diagnostic list" }))

        -- Enable inlay hints if supported
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
      end,
    })

    -- ========================================================================
    -- Diagnostic Configuration
    -- ========================================================================
    vim.diagnostic.config({
      virtual_text = true,  -- Show diagnostics inline
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "▲",
          [vim.diagnostic.severity.HINT] = "⚑",
          [vim.diagnostic.severity.INFO] = "»",
        },
      },
      update_in_insert = false,  -- Don't update diagnostics while typing
      underline = true,
      severity_sort = true,  -- Sort by severity
      float = {
        border = "rounded",
        source = true,  -- Show source of diagnostic
      },
    })

    -- ========================================================================
    -- LSP Server Configurations (Using vim.lsp.config)
    -- ========================================================================
    -- Default capabilities for all servers
    -- Extend with nvim-cmp capabilities for better completion support
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    -- Lua language server
    vim.lsp.config("lua_ls", {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },  -- Recognize 'vim' global
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),  -- Add vim runtime files
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    -- TypeScript/JavaScript language server
    vim.lsp.config("ts_ls", {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
      capabilities = capabilities,
    })

    -- Python language server
    vim.lsp.config("pyright", {
      cmd = { "pyright-langserver", "--stdio" },
      filetypes = { "python" },
      root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
      capabilities = capabilities,
    })

    -- Rust language server
    vim.lsp.config("rust_analyzer", {
      cmd = { "rust-analyzer" },
      filetypes = { "rust" },
      root_markers = { "Cargo.toml", "rust-project.json", ".git" },
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          check = {
            command = "clippy",  -- Use clippy for additional lints
          },
        },
      },
    })

    -- ========================================================================
    -- Format on Save
    -- ========================================================================
    -- Automatically format buffers on save using LSP
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
      callback = function(args)
        -- Skip if format-on-save is disabled
        if vim.b[args.buf].disable_autoformat or vim.g.disable_autoformat then
          return
        end

        -- Format using LSP
        vim.lsp.buf.format({
          bufnr = args.buf,
          timeout_ms = 1000,
          async = false,
        })
      end,
    })

    -- Toggle format-on-save
    vim.keymap.set("n", "<leader>tf", function()
      if vim.g.disable_autoformat then
        vim.g.disable_autoformat = false
        print("Format on save enabled")
      else
        vim.g.disable_autoformat = true
        print("Format on save disabled")
      end
    end, { desc = "Toggle format on save" })

    -- ========================================================================
    -- Enable LSP servers
    -- ========================================================================
    -- Enable all configured servers
    vim.lsp.enable({ "lua_ls", "ts_ls", "pyright", "rust_analyzer" })

    -- ========================================================================
    -- Add more LSP servers here following the same pattern:
    -- ========================================================================
    -- 1. Define the config:
    -- vim.lsp.config("server_name", {
    --   cmd = { "server-command" },
    --   filetypes = { "filetype1", "filetype2" },
    --   root_markers = { "marker1", ".git" },
    --   capabilities = capabilities,
    --   settings = {
    --     -- Server-specific settings
    --   },
    -- })
    --
    -- 2. Enable it:
    -- vim.lsp.enable("server_name")
  end,
}
