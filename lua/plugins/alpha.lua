return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local banner = {
      "  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
      "  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
      " ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
      " ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
      " ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
      " ░ ▒░   �▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
      " ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
      "    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
      "          ░    ░  ░    ░ ░        ░   ░         ░   ",
      "                                 ░                  ",
    }

    local banner_hls = {
      "AlphaHeader",
      "AlphaHeader",
      "AlphaHeader",
      "AlphaHeader",
      "AlphaHeader",
      "AlphaHeader",
      "AlphaHeader",
      "AlphaHeader",
      "AlphaHeader",
      "AlphaHeader",
    }

    dashboard.section.header.val = banner

    -- Menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "󰈔 New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("r", "󱔗 Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("f", "󰱼 Find file", ":Telescope find_files<CR>"),
      dashboard.button("g", "󰺮 Find text", ":Telescope live_grep <CR>"),
      dashboard.button("q", " Quit", ":qa<CR>"),
    }

    -- Footer
    local function footer()
      local version = vim.version()
      local pluginCount = vim.fn.len(vim.fn.globpath(vim.fn.stdpath("data") .. "/lazy", "*", 0, 1))
      local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
      local date = os.date("%d.%m.%Y")
      return " " .. print_version .. "   " .. pluginCount .. "   " .. date
    end

    dashboard.section.footer.val = footer()

    -- Colors for buttons and footer
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    -- Setup alpha dashboard
    alpha.setup(dashboard.config)

    -- Apply banner line highlights after alpha buffer is ready
    vim.schedule(function()
      local bufnr = vim.api.nvim_get_current_buf()
      for i, hl in ipairs(banner_hls) do
        vim.api.nvim_buf_add_highlight(bufnr, -1, hl, i - 1, 0, -1)
      end
    end)
  end,
}
