return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- Enable LSP-related overrides for improved markdown and completion docs rendering
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      -- Optional: Enhance hover and signature help with better UI
      hover = {
        enabled = true,
        silent = false,
        -- Customize popup style
        border = "rounded",
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger_on_newline = false,
          luasnip = true,
        },
        border = "rounded",
      },
    },

    -- Presets for better UI experience out-of-the-box
    presets = {
      bottom_search = true,        -- Move search to bottom
      command_palette = true,      -- Command line UI like a palette
      long_message_to_split = true, -- Long messages go to split
      inc_rename = false,          -- Disable incremental rename (optional)
      lsp_doc_border = true,       -- Add border to hover docs
    },

    -- Customize the popup menu
    cmdline = {
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { pattern = "^/", icon = " ", lang = "regex" },
        search_up = { pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "" },
        lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      },
    },

    -- Add some animation for popup windows (optional)
    views = {
      hover = { 
        border = { style = "rounded", text = { top = " Hover ", top_align = "center" } },
      },
      signature = {
        border = { style = "rounded", text = { top = " Signature ", top_align = "center" } },
      },
    },
  },

  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
