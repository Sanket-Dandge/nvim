return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function ()
    require("tokyonight").setup({
      styles={
        comments= { italic = true, bold = true },
        keywords= {italic = true, bold = true },
        functions= {italic = true, bold = true },
        conditionals= {italic = true },
      }
    })
		vim.cmd("colorscheme tokyonight-moon")
  end
}
