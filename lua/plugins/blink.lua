return {
    "saghen/blink.cmp",
    event = { "BufReadPre", "BufNewFile" },
    version = "1.*",
    dependencies = {
        "rafamadriz/friendly-snippets", -- Collection of useful snippets
        "moyiz/blink-emoji.nvim", -- Emoji completion
        "Kaiser-Yang/blink-cmp-dictionary", -- Dictionary source
    },
    opts = function(_, opts)
        -- Enable LuaSnip with friendly-snippets
        opts.snippets = {
            preset = "luasnip",
        }

        -- Customize appearance
        opts.appearance = {
            nerd_font_variant = "mono",
        }

        -- Disable in specific buffers
        opts.enabled = function()
            local ft = vim.bo[0].filetype
            return not vim.tbl_contains({ "TelescopePrompt", "minifiles", "snacks_picker_input" }, ft)
        end

        -- Completion window styling
        opts.completion = {
            menu = {
                border = "single",
            },
            documentation = {
                auto_show = true,
                window = {
                    border = "single",
                },
            },
        }

        -- Key mapping
        opts.keymap = {
            preset = "enter",
            ["<Tab>"] = { "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
        }

        -- Use Lua-based fuzzy implementation
        opts.fuzzy = {
            implementation = "lua",
        }

        -- Define sources
        opts.sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
                "emoji",
                "dictionary",
            },
            providers = {
                lsp = {
                    name = "lsp",
                    enabled = true,
                    module = "blink.cmp.sources.lsp",
                    min_keyword_length = 2,
                    score_offset = 90,
                },
                path = {
                    name = "Path",
                    module = "blink.cmp.sources.path",
                    score_offset = 30,
                    fallbacks = { "buffer" },
                    opts = {
                        show_hidden_files_by_default = true,
                        label_trailing_slash = true,
                    },
                },
                snippets = {
                    name = "snippets",
                    module = "blink.cmp.sources.snippets",
                    min_keyword_length = 2,
                    score_offset = 85,
                },
                buffer = {
                    name = "Buffer",
                    module = "blink.cmp.sources.buffer",
                    min_keyword_length = 2,
                    max_items = 5,
                    score_offset = 15,
                },
                emoji = {
                    name = "Emoji",
                    module = "blink-emoji",
                    min_keyword_length = 2,
                    score_offset = 93,
                    opts = {
                        insert = true,
                    },
                },
                dictionary = {
                    name = "Dict",
                    module = "blink-cmp-dictionary",
                    enabled = true,
                    min_keyword_length = 3,
                    max_items = 6,
                    score_offset = 20,
                    opts = {
                        dictionary_directories = {
                            vim.fn.expand "~/github/dotfiles-latest/dictionaries",
                        },
                        dictionary_files = {
                            vim.fn.expand "~/github/dotfiles-latest/neovim/neobean/spell/en.utf-8.add",
                            vim.fn.expand "~/github/dotfiles-latest/neovim/neobean/spell/es.utf-8.add",
                        },
                    },
                },
            },
        }

        return opts
    end,
}
