return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		-- Automatically install missing parsers when entering buffer
		auto_install = true,
	},
	{ "HiPhish/rainbow-delimiters.nvim", event = "BufRead" },
}
