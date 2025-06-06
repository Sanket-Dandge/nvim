return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "SmiteshP/nvim-navic",
    "neovim/nvim-lspconfig", -- ensure lsp is setup
  },
  event = "VeryLazy",
  config = function()
    local colors = {
      blue   = '#89b4fa',
      cyan   = '#94e2d5',
      black  = '#1e1e2e',
      white  = '#cdd6f4',
      red    = '#f38ba8',
      violet = '#cba6f7',
      grey   = '#313244',
      orange = '#fab387',
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet, gui = 'bold' },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = colors.black },
      },
      insert = {
        a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
      },
      visual = {
        a = { fg = colors.black, bg = colors.cyan, gui = 'bold' },
      },
      replace = {
        a = { fg = colors.black, bg = colors.red, gui = 'bold' },
      },
      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
      },
    }

    local navic = require("nvim-navic")

    local function relative_path()
      local file = vim.fn.expand("%:~:.")
      return file ~= "" and file or "[No Name]"
    end

    local function lsp_clients()
      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      if next(clients) == nil then return "No LSP" end
      local names = {}
      for _, client in pairs(clients) do
        table.insert(names, client.name)
      end
      return " " .. table.concat(names, ", ")
    end

    require("lualine").setup {
      options = {
        theme = bubbles_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        icons_enabled = true,
      },
      sections = {
        lualine_a = {
          { "mode", icon = "", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { { "branch", icon = "" }, "diff" },
        lualine_c = {
          { relative_path, icon = "" },
          {
            function()
              return navic.is_available() and navic.get_location() or ""
            end,
            cond = navic.is_available,
            color = { fg = colors.orange },
          },
        },
        lualine_x = {
          { lsp_clients, color = { fg = colors.cyan } },
          { "encoding" },
          { "fileformat" },
        },
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
