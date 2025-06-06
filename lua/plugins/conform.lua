return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt", "lsp_format" },
                javascript = { "prettierd", "prettier" },
                cpp = { "clang_format" },
                c = { "clang_format" },
                latex = { "latexindent" },
                markdown = { "prettier", "prettierd" },
            },
            formatters = {
                stylua = {
                    prepend_args = { "--indent-width", "4" },
                },
                clang_format = {
                    prepend_args = { "-style", "{IndentWidth: 4}" },
                },
                prettier = {
                    prepend_args = { "--tab-width", "4" },
                },
                prettierd = {
                    prepend_args = { "--tab-width", "4" },
                },
                latexindent = {
                    prepend_args = { "-l", "--indent", "4" },
                },
                rustfmt = {
                    -- make sure rustfmt.toml or rustfmt config uses indent_style = "Block" and tab_spaces = 4
                    extra_args = { "--config", "tab_spaces=4" },
                },
            },
        })
    end
}
