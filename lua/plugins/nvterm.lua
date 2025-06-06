return {
  "NvChad/nvterm",
  config = function()
    require("nvterm").setup({
      terminals = {
        shell = vim.o.shell,  -- Use your default shell from Neovim
        list = {},            -- Customize terminal lists if needed
        type_opts = {
          float = {
            relative = "editor",
            row = 0.3,
            col = 0.25,
            width = 0.5,
            height = 0.4,
            border = "single",  -- You can change to "rounded" or "double"
          },
          horizontal = {
            location = "rightbelow",
            split_ratio = 0.3,  -- 30% height horizontal split
          },
          vertical = {
            location = "rightbelow",
            split_ratio = 0.5,  -- 50% width vertical split
          },
        },
      },

      behavior = {
        autoclose_on_quit = {
          enabled = false,  -- Don't auto-close terminal on quit to avoid accidental close
          confirm = true,   -- Confirm before closing terminal if enabled
        },
        close_on_exit = true,  -- Close terminal window when process exits
        auto_insert = true,    -- Automatically enter insert mode when terminal opens
      },

      -- Optional: Keybindings for quick terminal toggling (customize if you want)
      -- You can add this outside setup or integrate here with a keymaps config
      -- For example:
      -- keymaps = {
      --   float = "<leader>tf",
      --   horizontal = "<leader>th",
      --   vertical = "<leader>tv",
      -- },
    })
  end,
}
