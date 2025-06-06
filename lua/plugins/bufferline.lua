return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local bufferline = require("bufferline")

        bufferline.setup {
            options = {
                mode = "buffers",
                style_preset = bufferline.style_preset.minimal, -- you can try .default for more styling
                separator_style = "slant", -- "slant" | "padded_slant" | "thick" | "thin" | "slope" | "none"
                indicator = {
                    icon = "▎", -- could be a dot or bar
                    style = "icon",
                },
                buffer_close_icon = "󰅖",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                color_icons = true,
                show_close_icon = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                diagnostics_indicator = function(_, _, diagnostics_dict, _)
                    local s = ""
                    for e, n in pairs(diagnostics_dict) do
                        local sym = (e == "error" and " ")
                            or (e == "warning" and " ")
                            or (e == "info" and " ")
                            or " "
                        s = s .. n .. sym
                    end
                    return s
                end,
                numbers = function(opts)
                    return string.format(" %s", opts.ordinal)
                end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "  File Explorer",
                        highlight = "Directory",
                        text_align = "center",
                        separator = true,
                    },
                },
                always_show_bufferline = true,
                enforce_regular_tabs = false,
            },
            highlights = {
                fill = {
                    bg = "#1e1e2e",
                },
                background = {
                    fg = "#a6adc8",
                    bg = "#1e1e2e",
                },
                buffer_selected = {
                    fg = "#cdd6f4",
                    bg = "#313244",
                    bold = true,
                    italic = false,
                },
                separator_selected = {
                    fg = "#89b4fa",
                    bg = "#313244",
                },
                indicator_selected = {
                    fg = "#89b4fa",
                    bg = "#313244",
                },
            },
        }
    end,
}
