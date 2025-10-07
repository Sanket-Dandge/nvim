return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "SmiteshP/nvim-navic",
    "neovim/nvim-lspconfig",
  },
  event = "VeryLazy",
  config = function()
    local colors = {
      bg       = "#1e1e2e",
      fg       = "#cdd6f4",
      red      = "#f38ba8",
      orange   = "#fab387",
      yellow   = "#f9e2af",
      green    = "#a6e3a1",
      cyan     = "#94e2d5",
      blue     = "#89b4fa",
      violet   = "#cba6f7",
      grey     = "#313244",
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        b = { fg = colors.fg, bg = colors.grey },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.green, gui = "bold" },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.violet, gui = "bold" },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.red, gui = "bold" },
      },
      command = {
        a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
      },
      inactive = {
        a = { fg = colors.grey, bg = colors.bg },
        b = { fg = colors.grey, bg = colors.bg },
        c = { fg = colors.grey, bg = colors.bg },
      },
    }

    -- local navic = require("nvim-navic")

    local function relative_path()
      local file = vim.fn.expand("%:~:.")
      return file ~= "" and file or "[No Name]"
    end

    local function lsp_clients()
      local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
      if not clients or #clients == 0 then return "󰘦 No LSP" end
      local names = {}
      for _, client in ipairs(clients) do
        table.insert(names, client.name)
      end
      return " " .. table.concat(names, ", ")
    end

    require("lualine").setup {
      options = {
        theme = bubbles_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        icons_enabled = true,
        -- disabled_filetypes = { "alpha", "dashboard", "NvimTree" },
      },
      sections = {
        lualine_a = {
          { "mode", icon = "", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = {
          { "branch", icon = "" },
          { "diff", symbols = { added = " ", modified = " ", removed = " " } },
        },
        lualine_c = {
          { relative_path, icon = "", padding = { left = 1, right = 1 } },
          {
            -- function()
            --   return navic.is_available() and navic.get_location() or ""
            -- end,
            -- cond = navic.is_available,
            -- color = { fg = colors.orange },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = " ",
              warn  = " ",
              info  = " ",
              hint  = "󰌵 ",
            },
            diagnostics_color = {
              error = { fg = colors.red },
              warn  = { fg = colors.yellow },
              info  = { fg = colors.blue },
              hint  = { fg = colors.cyan },
            },
          },
          { lsp_clients, color = { fg = colors.cyan } },
          { "encoding", icon = "󰈛" },
          { "fileformat", icons_enabled = true, symbols = { unix = "", mac = "", dos = "" } },
        },
        lualine_y = {
          { "filetype", icon_only = false },
          { "progress" },
        },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { relative_path, icon = "" } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    }
  end,
}
