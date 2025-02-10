return {
  "gregorias/nvim-mapper",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").load_extension("mapper")
    require("nvim-mapper").setup({
      --- Uses <leader>MM as keybinding to open the Telescope Mapper
      no_map = false,
    })
    local Mapper = require("nvim-mapper")
    local ls = require("luasnip")
    local gitsigns = require("gitsigns")

    vim.g.mapleader = " "

    -- Mapper.map("n", "<leader>tm", ":Telescope Mapper<CR>", "Telescope", "mapper", "Show mapping through Telescope")

                        -----------------------------------------
                        ---         Save current file         ---
                        -----------------------------------------
    Mapper.map("n", "<C-s>", "<cmd>w<cr>", { remap = true }, "File", "save_file", "Save file")

                        -----------------------------------------
                        ---         Increment/decrement       ---
                        -----------------------------------------
    Mapper.map("n", "+", "<C-a>", { noremap = true }, "Numbering", "increment", "Increment numbers")
    Mapper.map("n", "-", "<C-x>", { noremap = true }, "Numbering", "decrement", "Decrement numbers")

                        -----------------------------------------
                        ---             Select all            ---
                        -----------------------------------------
    Mapper.map("n", "<C-a>", "gg<S-v>G", { noremap = true }, "Selection", "select_all", "Select all")
    Mapper.map("n", "<Esc>", "<cmd>noh<cr>", { remap = true }, "Selection", "remove_highlight", "Remove Highlight After Searching")

                        -----------------------------------------
                        ---             Indenting             ---
                        -----------------------------------------
    Mapper.map("v", "<", "<gv", { silent = true, noremap = true }, "Indenting", "indent_back", "Indenting Backward")
    Mapper.map("v", ">", ">gv", { silent = true, noremap = true }, "Indenting", "indent_front", "Indenting Forward")

                        -----------------------------------------
                        ---               New tab             ---
                        -----------------------------------------
    Mapper.map("n", "te", ":e ", { noremap = true }, "File", "new_tab", "Creating New Tab")

                        -----------------------------------------
                        ---             Split window          ---
                        -----------------------------------------
    Mapper.map("n", "<leader>sh", ":split<Return><C-w>w", { noremap = true }, "Window Management", "split_horizontal", "Split window horizontal")
    Mapper.map("n", "<leader>sv", ":vsplit<Return><C-w>w", { noremap = true }, "Window Management", "split_vertical", "Split vertical")

                        -----------------------------------------
                        ---             Resize window         ---
                        -----------------------------------------
    Mapper.map("n", "<C-Up>", ":resize -3<CR>", { noremap = true }, "Window Management", "resize_up", "Resizing Window Up")
    Mapper.map("n", "<C-Down>", ":resize +3<CR>", { noremap = true }, "Window Management", "resize_down", "Resizing Window Down")
    Mapper.map("n", "<C-Left>", ":vertical resize -3<CR>", { noremap = true }, "Window Managment", "resize_left", "Resizing Window Left")
    Mapper.map("n", "<C-Right>", ":vertical resize +3<CR>", { noremap = true }, "Window Management", "resize_right", "Resizing Window Right")

                        -----------------------------------------
                        ---             Bufferline            ---
                        -----------------------------------------
    Mapper.map("n", "<Tab>", ":bnext<cr>", { noremap = true }, "File", "tab_next", "Move to next tab")
    Mapper.map("n", "<S-Tab>", ":bprevious<cr>", { noremap = true }, "File", "tab_previous", "Move to previous tab")
    Mapper.map("n", "<leader>tc", ":bdelete<CR>", { noremap = true }, "File", "tab_close", "Close the current tab")
    Mapper.map("n", "<leader>gB", ":BufferLinePick<CR>", { remap = true }, "File", "tab_change", "Change tab using characters")

                        -----------------------------------------
                        ---             Portal.nvim           ---
                        -----------------------------------------
    Mapper.map("n", "<leader>o", "<cmd>Portal jumplist backward<cr>", { noremap = true }, "File", "jumplist_backward", "Jumplist Backward")
    Mapper.map("n", "<leader>i", "<cmd>Portal jumplist forward<cr>", { noremap = true }, "File", "jumplist_forward", "Jumplist Forward")

                        -----------------------------------------
                        ---             Telescope             ---
                        -----------------------------------------
    Mapper.map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true }, "Telescope", "find_files", "Find Files")
    Mapper.map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true }, "Telescope", "live_grep", "Live Grep")
    Mapper.map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true }, "Telescope", "old_files", "Old Files")
    Mapper.map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true }, "Telescope", "buffers", "Buffers")
    Mapper.map("n", "<leader>fd", function()
      require('telescope.builtin').find_files({ cwd = '~/.config/nvim' })
    end, { noremap = true, silent = true }, "Telescope", "find_nvim_config_files", "Find files in nvim config")
    Mapper.map("n", "<leader>fs", function()
      require('telescope.builtin').find_files({ cwd = '~/.config/bspwm' })
    end, { noremap = true, silent = true }, "Telescope", "find_bspwm_config_files", "Find files in bspwm config")

                        -----------------------------------------
                        ---               Gitsigns            ---
                        -----------------------------------------
    Mapper.map('n', '<leader>hs', gitsigns.stage_hunk, { remap = true }, "Git", "stage_hunk", "Stage current hunk")
    Mapper.map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end, { remap = true }, "Git", "nav_hunk_next", "Navigate to the next hunk")

    Mapper.map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end, { remap = true }, "Git", "nav_hunk_prev", "Navigate to the previous hunk")

    Mapper.map('n', '<leader>hr', gitsigns.reset_hunk, { remap = true }, "Git", "reset_hunk", "Reset current hunk")
    Mapper.map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { remap = true }, "Git", "stage_hunk_visual", "Stage selected hunk")
    Mapper.map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { remap = true }, "Git", "reset_hunk_visual", "Reset selected hunk")
    Mapper.map('n', '<leader>hS', gitsigns.stage_buffer, { remap = true }, "Git", "stage_buffer", "Stage the entire buffer")
    Mapper.map('n', '<leader>hu', gitsigns.undo_stage_hunk, { remap = true }, "Git", "undo_stage_hunk", "Undo the stage for last hunk")
    Mapper.map('n', '<leader>hR', gitsigns.reset_buffer, { remap = true }, "Git", "reset_buffer", "Reset the entire buffer")
    Mapper.map('n', '<leader>hp', gitsigns.preview_hunk, { remap = true }, "Git", "preview_hunk", "Preview the current hunk")
    Mapper.map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, { remap = true }, "Git", "blame_line", "Blame the current line (full)")
    Mapper.map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { remap = true }, "Git", "toggle_blame", "Toggle blame for the current line")
    Mapper.map('n', '<leader>hd', gitsigns.diffthis, { remap = true }, "Git", "diff_this", "Diff the current buffer with the index")
    Mapper.map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { remap = true }, "Git", "diff_this_head", "Diff the current buffer with HEAD")
    Mapper.map('n', '<leader>td', gitsigns.toggle_deleted, { remap = true }, "Git", "toggle_deleted", "Toggle showing deleted lines")
    Mapper.map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { remap = true }, "Git", "select_hunk", "Select hunk text object")

                        -----------------------------------------
                        ---           Nvterm Mappings         ---
                        -----------------------------------------
    Mapper.map("n", "<A-v>", function() require("nvterm.terminal").toggle "vertical" end, { noremap = true, silent = true }, "Window Management", "toggle_vertical_term_normal", "Toggle vertical terminal")
    Mapper.map("t", "<A-v>", function() require("nvterm.terminal").toggle "vertical" end, { noremap = true, silent = true }, "Window Management", "toggle_vertical_term_terminal", "Toggle vertical terminal")

    Mapper.map("n", "<A-h>", function() require("nvterm.terminal").toggle "horizontal" end, { noremap = true, silent = true }, "Window Management", "toggle_horizontal_term_normal", "Toggle horizontal terminal")
    Mapper.map("t", "<A-h>", function() require("nvterm.terminal").toggle "horizontal" end, { noremap = true, silent = true }, "Window Management", "toggle_horizontal_term_terminal", "Toggle horizontal terminal")

    Mapper.map("n", "<A-i>", function() require("nvterm.terminal").toggle "floating" end, { noremap = true, silent = true }, "Window Management", "toggle_floating_term_normal", "Toggle floating terminal")
    Mapper.map("t", "<A-i>", function() require("nvterm.terminal").toggle "floating" end, { noremap = true, silent = true }, "Window Management", "toggle_floating_term_terminal", "Toggle floating terminal")

    Mapper.map("n", "<leader>h", function() require("nvterm.terminal").new "horizontal" end, { noremap = true, silent = true }, "Window Management", "new_horizontal_term_normal", "New horizontal terminal")
    Mapper.map("n", "<leader>v", function() require("nvterm.terminal").new "vertical" end, { noremap = true, silent = true }, "Window Management", "new_vertical_term_terminal", "New vertical terminal")

                        -----------------------------------------
                        ---           Tagbar Mapping          ---
                        -----------------------------------------
    Mapper.map("n", "<F8>", "<cmd>TagbarToggle<CR>", { remap = true }, "Window Management", "toggle_tagbar", "Toggle Tagbar")

                        -----------------------------------------
                        ---             Dap Keymaps           ---
                        -----------------------------------------
    local dap = require("dap")
    local dapui = require("dapui")

    Mapper.map("n", "<space>b", dap.toggle_breakpoint, { noremap = true }, "Dap", "toggle_breakpoint", "Toggle Breakpoint")
    Mapper.map("n", "<space>gb", dap.run_to_cursor, { noremap = true }, "Dap", "run_to_cursor", "Run to Cursor")
    Mapper.map("n", "<space>?", function() dapui.eval(nil, { enter = true }) end, { remap = true }, "Dap", "evaluate_expression", "Evaluate Expression")
    Mapper.map("n", "<F1>", dap.continue, { remap = true }, "Dap", "continue_execution", "Continue Execution")
    Mapper.map("n", "<F2>", dap.step_into, { remap = true }, "Dap", "step_into", "Step Into")
    Mapper.map("n", "<F3>", dap.step_over, { remap = true }, "Dap", "step_over", "Step Over")
    Mapper.map("n", "<F4>", dap.step_out, { remap = true }, "Dap", "step_out", "Step Out")
    Mapper.map("n", "<F5>", dap.step_back, { remap = true }, "Dap", "step_back", "Step Back")
    Mapper.map("n", "<F13>", dap.restart, { remap = true }, "Dap", "restart", "Restart Debugging")
    Mapper.map("n", "<Leader>du", "<cmd>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true }, "Dap", "toggle_dapui", "Toggle DapUI")

                        -----------------------------------------
                        ---               TreeSJ              ---
                        -----------------------------------------
    Mapper.map("n", "<leader>m", "<cmd>TSJToggle<cr>", { noremap = true }, "Indenting", "treesitter_join", "Toggle Treesitter Join")

                        -----------------------------------------
                        ---            Noice Dismiss          ---
                        -----------------------------------------
    Mapper.map("n", "<leader>nd", "<cmd>NoiceDismiss<cr>", { noremap = true, silent = true }, "Message", "dismiss_noice", "Dismiss Noice Message")

                        -----------------------------------------
                        ---                 LSP               ---
                        -----------------------------------------
    Mapper.map_buf(0, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true }, "LSP", "lsp_definitions", "Go to definition")

                        -----------------------------------------
                        ---              Snippets             ---
                        -----------------------------------------
    Mapper.map({ "i", "s" }, "<c-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump(1)
      end
    end, { silent = true }, "Snippets", "snippet_jump_or_expand", "Expand or jump to next snippet placeholder")

    Mapper.map({ "i", "s" }, "<c-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true }, "Snippets", "snippet_jump_previous", "Jump to previous snippet placeholder")

  end,
}
