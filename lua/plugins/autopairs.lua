-- ============================================================================
-- Auto Pairs Plugin
-- ============================================================================
-- Automatically insert closing brackets, quotes, etc.
-- GitHub: https://github.com/windwp/nvim-autopairs

return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",  -- Load only when entering insert mode
  dependencies = {
    "hrsh7th/nvim-cmp",  -- Integration with completion engine
  },
  opts = {
    check_ts = true,  -- Use treesitter to check for pair insertion
    ts_config = {
      lua = { "string" },  -- Don't add pairs in lua string treesitter nodes
      javascript = { "template_string" },
    },
  },
  config = function(_, opts)
    local npairs = require("nvim-autopairs")
    npairs.setup(opts)

    -- Integration with cmp: auto-insert pairs on completion confirm
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
