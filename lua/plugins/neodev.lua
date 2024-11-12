return {
  "folke/neodev.nvim",
  opts = {
    library = {
      plugins = {
        "nvim-dap-ui",
      },
      types = true,
    },
  },
  config = function()
    require("neodev").setup({
      library = {
        plugins = {
          "nvim-dap-ui",
        },
        types = true,
      },
    })
  end,
}
