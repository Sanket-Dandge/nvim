return {
    {
        "nvim-telescope/telescope-media-files.nvim",
        event = "VeryLazy", -- Load on very lazy event for performance
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        lazy = true, -- Lazy load when required
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        event = "VeryLazy", -- Lazy load on very lazy event
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Native fzf sorter for speed
        },
        config = function()
            local telescope = require "telescope"
            local actions = require "telescope.actions"
            local action_state = require "telescope.actions.state"
            local themes = require "telescope.themes"

            -- Custom action to open multiple selected files
            local function multi_open(prompt_bufnr)
                local picker = action_state.get_current_picker(prompt_bufnr)
                local selections = picker:get_multi_selection()

                actions.close(prompt_bufnr)

                if #selections <= 1 then
                    -- If no multiple selections, fallback to current entry
                    local entry = action_state.get_selected_entry()
                    if entry and entry.path then
                        vim.cmd("edit " .. vim.fn.fnameescape(entry.path))
                    end
                else
                    for _, entry in ipairs(selections) do
                        if entry.path then
                            vim.cmd("edit " .. vim.fn.fnameescape(entry.path))
                        end
                    end
                end
            end

            telescope.setup {
                defaults = {
                    -- You can add default options here, for example:
                    -- prompt_prefix = "🔍 ",
                    -- selection_caret = "➤ ",
                    -- layout_strategy = "horizontal",
                    -- sorting_strategy = "ascending",
                    -- path_display = { "smart" },
                    mappings = {
                        i = {
                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                            ["<CR>"] = multi_open,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        },
                        n = {
                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                            ["<CR>"] = multi_open,
                            ["q"] = actions.close,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = themes.get_dropdown {},
                    media_files = {
                        filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "pdf" },
                        find_cmd = "rg",
                    },
                },
            }

            -- Load extensions explicitly
            telescope.load_extension "ui-select"
            telescope.load_extension "scope" -- if you have scope installed
            telescope.load_extension "noice" -- if you use noice integration
            telescope.load_extension "fzf" -- fzf-native extension for faster sorting
            telescope.load_extension "media_files" -- media files extension
        end,
    },
}
