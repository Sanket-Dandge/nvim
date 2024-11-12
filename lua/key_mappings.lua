local map = vim.keymap.set
vim.g.mapleader = " "

                    -----------------------------------------
                    ---         Save current file         ---
                    -----------------------------------------
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file", remap = true })

                    -----------------------------------------
                    ---         ESC pressing jk or lk     ---
                    -----------------------------------------
map("i", "jk", "<ESC>", { desc = "jk to esc", noremap = true })

                    -----------------------------------------
                    ---         Increment/decrement       ---
                    -----------------------------------------
map("n", "+", "<C-a>", { desc = "Increment numbers", noremap = true })
map("n", "-", "<C-x>", { desc = "Decrement numbers", noremap = true })

                    -----------------------------------------
                    ---             Select all            ---
                    -----------------------------------------
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all", noremap = true })

                    -----------------------------------------
                    ---             Indenting             ---
                    -----------------------------------------
map("v", "<", "<gv", { desc = "Indenting", silent = true, noremap = true })
map("v", ">", ">gv", { desc = "Indenting", silent = true, noremap = true })

                    -----------------------------------------
                    ---               New tab             ---
                    -----------------------------------------
map("n", "te", ":tabedit")

                    -----------------------------------------
                    ---             Split window          ---
                    -----------------------------------------
map("n", "<leader>sh", ":split<Return><C-w>w", { desc = "Split horizontal", noremap = true })
map("n", "<leader>sv", ":vsplit<Return><C-w>w", { desc = "Split vertical", noremap = true })

                    -----------------------------------------
                    ---      Navigate vim panes better    ---
                    -----------------------------------------
map("n", "<c-k>", ":wincmd k<CR>", { desc = "Navigate up" })
map("n", "<c-j>", ":wincmd j<CR>", { desc = "Navigate down" })
map("n", "<c-h>", ":wincmd h<CR>", { desc = "Navigate left" })
map("n", "<c-l>", ":wincmd l<CR>", { desc = "Navigate right" })

                    -----------------------------------------
                    ---             Resize window         ---
                    -----------------------------------------
map("n", "<C-Up>", ":resize -3<CR>")
map("n", "<C-Down>", ":resize +3<CR>")
map("n", "<C-Left>", ":vertical resize -3<CR>")
map("n", "<C-Right>", ":vertical resize +3<CR>")

                    -----------------------------------------
                    ---             Bufferline            ---
                    -----------------------------------------
map("n", "<Tab>", ":bnext<cr>", { desc = "Move to next tab", noremap = true })
map("n", "<S-Tab>", ":bprevious<cr>", { desc = "Move to previous tab", noremap = true })
map("n", "<leader>tc", ":bdelete<cr>", { desc = "Delete the tab", noremap = true })
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open a new tab", noremap = true })

                    -----------------------------------------
                    ---             Portal.nvim           ---
                    -----------------------------------------
map("n", "<leader>o", "<cmd>Portal jumplist backward<cr>", { desc = "Jumplist Backward" })
map("n", "<leader>i", "<cmd>Portal jumplist forward<cr>", { desc = "Jumplist Forward" })

                    -----------------------------------------
                    ---             Telescope             ---
                    -----------------------------------------
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files", noremap = true })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep", noremap = true })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Old files", noremap = true })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers", noremap = true })

                    -----------------------------------------
                    ---         Complete Selection        ---
                    -----------------------------------------
map("n", "<C-a>", "ggVG", { desc = "Select all", noremap = false })

                    -----------------------------------------
                    ---               Gitsigns            ---
                    -----------------------------------------
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

                    -----------------------------------------
                    ---           Nvterm Mappings         ---
                    -----------------------------------------
map("n", "<A-v>", function() require("nvterm.terminal").toggle "vertical" end, { desc = "Toggle vertical term" })
map("t", "<A-v>", function() require("nvterm.terminal").toggle "vertical" end, { desc = "Toggle vertical term" })

map("n", "<A-h>", function() require("nvterm.terminal").toggle "horizontal" end, { desc = "Toggle horizontal term" })
map("t", "<A-h>", function() require("nvterm.terminal").toggle "horizontal" end, { desc = "Toggle horizontal term" })

map("n", "<A-i>", function() require("nvterm.terminal").toggle "floating" end, { desc = "Toggle floating term" })
map("t", "<A-i>", function() require("nvterm.terminal").toggle "floating" end, { desc = "Toggle floating term" })

map("n", "<leader>h", function() require("nvterm.terminal").new "horizontal" end, { desc = "New vertical term" })
map("n", "<leader>v", function() require("nvterm.terminal").new "vertical" end, { desc = "New vertical term" })

                    -----------------------------------------
                    ---           Tagbar Mapping          ---
                    -----------------------------------------
map("n", "<F8>", "<cmd>TagbarToggle<CR>", { desc = "Toggle Tagbar", remap = true })

                    -----------------------------------------
                    ---      Oil File Explorer Mapping    ---
                    -----------------------------------------
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

                    -----------------------------------------
                    ---             Dap Keymaps           ---
                    -----------------------------------------
local dap = require("dap")
vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

vim.keymap.set("n", "<space>?", function ()
  require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F13>", dap.restart)

-- Key mapping to toggle dap-ui manually
vim.api.nvim_set_keymap("n", "<Leader>du", "<cmd>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })
