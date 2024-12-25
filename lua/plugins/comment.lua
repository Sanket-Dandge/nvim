return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		toggler = {
			line =  "gcc",
			block = "gtb", "gtc",
		},
		opleader = {
			line = "goc",
			block = "gob",
		},
	},
}
