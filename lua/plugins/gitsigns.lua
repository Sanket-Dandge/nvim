local M = {}

-- gitsigns configuration
M.gitsigns = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "󰍵" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "│" },
  },
  on_attach = function(bufnr)
    -- require("utils").load_mappings("gitsigns", { buffer = bufnr })
  end,
}

-- Plugin setup
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    config = function()
      require("gitsigns").setup(M.gitsigns)
    end,
  },
  -- Add more plugins configurations here
}
