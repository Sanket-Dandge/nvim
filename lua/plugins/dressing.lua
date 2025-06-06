return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",  -- Load on very lazy event for performance
  opts = {
    input = {
      -- Use a nicer UI for input prompts
      enabled = true,
      default_prompt = "➤ ",
      insert_only = false, -- allow prompt in normal mode too
      win_options = {
        winblend = 10, -- slight transparency
        -- You can also customize border style here:
        -- border = "rounded",
      },
    },
    select = {
      enabled = true,
      backend = { "telescope", "fzf", "builtin" }, -- fallback order for selection UI
      telescope = {
        -- telescope options when used as backend
        layout_strategy = "center",
        layout_config = { width = 0.6, height = 0.4 },
      },
    },
  },
  config = function(_, opts)
    require("dressing").setup(opts)
  end,
}
