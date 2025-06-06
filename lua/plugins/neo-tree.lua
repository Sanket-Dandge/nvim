return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<C-n>", "<CMD>Neotree toggle<CR>", desc = "Toggle File Explorer" },
    { "<leader>nb", "<CMD>Neotree buffers reveal float<CR>", desc = "Buffer Explorer" },
  },
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      popup_border_style = "rounded",

      sort_case_insensitive = true,
      use_default_mappings = true,
      enable_normal_mode_for_inputs = false,

      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
          default = "",
        },
        indent = {
          with_expanders = true, -- if file nesting is enabled
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        modified = {
          symbol = "●",
          highlight = "NeoTreeModified",
        },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          },
        },
      },

      source_selector = {
        winbar = true,
        statusline = false,
        content_layout = "center",
        tabs_layout = "equal",
      },

      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true,
        },
        group_empty_dirs = true,
      },

      window = {
        position = "left",
        width = 35,
        mappings = {
          ["<space>"] = "none", -- disable space key
          ["l"] = "open",
          ["h"] = "close_node",
          ["<CR>"] = "open_drop",
        },
      },

      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd [[ setlocal relativenumber ]]
          end,
        },
      },
    })
  end,
}
