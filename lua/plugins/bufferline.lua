return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local bufferline = require("bufferline")
		local api = vim.api

		bufferline.setup({
			options = {
				mode = "buffers", -- Show only buffers in bufferline
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						highlight = "Directory",
						separator = true,
					},
				},
				diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
              or (e == "warning" and " " or " ")
            s = s .. n .. sym
          end
          return s
        end,
				numbers = function(opts)
					return string.format("%s", opts.raise(opts.ordinal))
				end,
				groups = {
					options = {
						toggle_hidden_on_enter = true, -- Reveal hidden groups on hover
					},
					items = {
						{
							name = "TESTS",
							highlight = { sp = "red" },
							priority = 2,
							icon = "",
							matcher = function(buf)
								local name = api.nvim_buf_get_name(buf.id)
								return name:match("%_test") or name:match("%_spec")
							end,
						},
						{
							name = "MAIN",
							highlight = { sp = "green" },
							auto_close = false,
							matcher = function(buf)
								local name = api.nvim_buf_get_name(buf.id)
								return name:match("%.md") or name:match("%.txt") or name:match("%.cpp") or name:match("%.h")
							end,
						},
						{
							name = "NVIM",
							highlight = { sp = "lightpink" },
							auto_close = false,
							matcher = function(buf)
								local name = api.nvim_buf_get_name(buf.id)
								return name:match("%.lua") or name:match("lazy-lock.json") or name:match("%.nvim")
							end,
						},
					},
				},
			},
		})
	end,
}
