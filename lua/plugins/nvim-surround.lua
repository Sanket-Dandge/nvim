-- ysw" to add " to a word

return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  dependencies = {
    "karb94/neoscroll.nvim",
  },
  config = function()
    require("nvim-surround").setup { keymaps = { visual = "gs", "ds" } }
  end,
}

