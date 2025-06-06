return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local hooks = require("ibl.hooks")
    local highlight = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
    }

    -- Define highlight colors (you can tweak these)
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#E06C75", nocombine = true })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#E5C07B", nocombine = true })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#98C379", nocombine = true })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#56B6C2", nocombine = true })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = "#61AFEF", nocombine = true })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = "#C678DD", nocombine = true })

    -- Enable context (current indentation scope)
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#ABB2BF", bold = true })
    end)

    require("ibl").setup({
      indent = {
        char = "│",
        highlight = highlight,
      },
      scope = {
        enabled = true,
        char = "▏",
        highlight = { "IblScope" },
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = { "help", "terminal", "dashboard", "lazy", "lspinfo", "TelescopePrompt", "neo-tree" },
        buftypes = { "terminal", "nofile" },
      },
    })
  end,
}
