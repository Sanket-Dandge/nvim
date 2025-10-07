return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        config = function()
            local config = require "nvim-treesitter.configs"
            config.setup {
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = { "latex" },
                },
                indent = { enable = true },
                ensure_installed = { "regex" },
            }
        end,
    },
}
