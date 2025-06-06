return {
  "OXY2DEV/markview.nvim",
  event = { "BufReadPost", "BufNewFile" }, -- load on buffer open/new file for better startup
  config = function()
    require("markview").setup({
      -- Example options to get you started (customize as needed)
      signs = true,            -- show marks in the sign column
      virt_text = true,        -- show marks as virtual text
      highlight = "Search",    -- highlight style for marks
      refresh_interval = 300,  -- refresh marks every 300ms
      -- Add more options here from the plugin docs
    })
  end,
}
