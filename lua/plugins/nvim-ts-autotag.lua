return {
  "windwp/nvim-ts-autotag",
  event = "VeryLazy",
  ft = { "html", "javascriptreact" },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
