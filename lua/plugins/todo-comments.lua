return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
            --
    }
  end,
}

--  todo-comments keywords are => PERF, HACK, TODO, NOTE, FIX, WARNING
