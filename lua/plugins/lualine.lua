return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    -- display lsp clients in lualine
    { "yavorski/lualine-lsp-client-name.nvim" },
  },
  event = "VeryLazy",
  config = function()
    local colors = {
      blue   = '#80a0ff',
      cyan   = '#79dac8',
      black  = '#080808',
      white  = '#c6c6c6',
      red    = '#ff5189',
      violet = '#d183e8',
      grey   = '#303030',
      orange = '#ffa500',
    }
    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
      },
      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },
      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }
    local navic = require('nvim-navic')
    local function relative_path()
      local file = vim.fn.expand("%:~:.")
      return file ~= "" and file or "[No Name]"
    end

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '',
        -- section_separators = { left = '', right = '' },
        -- section_separators = { fg = colors.blue, bg = colors.violet }
      },
      sections = {
        lualine_a = { { 'mode', --[[separator = { left = '' },]] right_padding = 2 } },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { { relative_path }
          -- '%=', --[[ add your center compoentnts here in place of this comment ]]
          -- ,function()
          --   return navic.get_location()
          -- end,
        },
        lualine_x = { 'lsp_client_name', 'encoding' },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', --[[separator = { right = '' },]] left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
