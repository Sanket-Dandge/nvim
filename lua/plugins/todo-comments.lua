return {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("todo-comments").setup {
            keywords = {
                INTENT = {
                    icon = " ", -- notepad-style icon
                    color = "#89b4fa", -- soft blue (gentle on dark backgrounds)
                },
                INFO = {
                    icon = " ", -- standard information symbol
                    color = "#74c7ec", -- brighter cyan-blue for emphasis
                },
            },
            colors = {
                info = { "DiagnosticInfo", "#5fd7ff" }, -- optional global override
            },
        }
    end,
}

--  todo-comments keywords are => PERF, HACK, TODO, NOTE, FIX, WARNING
