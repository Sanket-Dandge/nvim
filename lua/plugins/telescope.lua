return {
  {
    "nvim-telescope/telescope-media-files.nvim",
    event = "VeryLazy",  -- Load on very lazy event for performance
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = true,         -- Lazy load when required
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    event = "VeryLazy",  -- Lazy load on very lazy event
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Native fzf sorter for speed
    },
    config = function()
      local telescope = require("telescope")
      local themes = require("telescope.themes")

      telescope.setup({
        defaults = {
          -- You can add default options here, for example:
          -- prompt_prefix = "🔍 ",
          -- selection_caret = "➤ ",
          -- layout_strategy = "horizontal",
          -- sorting_strategy = "ascending",
          -- path_display = { "smart" },
          mappings = {
            i = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },
        extensions = {
          ["ui-select"] = themes.get_dropdown({}),
          -- Add any other extension configurations here
        },
      })

      -- Load extensions explicitly
      telescope.load_extension("ui-select")
      telescope.load_extension("scope")  -- if you have scope installed
      telescope.load_extension("noice")  -- if you use noice integration
      telescope.load_extension("fzf")    -- fzf-native extension for faster sorting
      telescope.load_extension("media_files")  -- media files extension
    end,
  },
}
