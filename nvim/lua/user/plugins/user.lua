return {
	{
		"petertriho/nvim-scrollbar",
		-- lazy = false,
		event = "BufEnter",
		config = function() require("scrollbar").setup() end,
	},
	{
		"kevinhwang91/nvim-hlslens",
		-- lazy = false,
		event = "CmdlineEnter",
		config = function() require("hlslens").setup() end,
	},
	-- lsp_lines (pretty diagnostics)
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		lazy = false,
		dependencies = { "mason-lspconfig.nvim" },
		module = "lsp_lines",
		config = function() require("lsp_lines").setup() end,
	},
	{
		"p00f/clangd_extensions.nvim", -- install lsp plugin
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = { "clangd" }, -- automatically install lsp
			},
		},
		ft = { "cpp", "hpp" },
	},
	{ "famiu/bufdelete.nvim",          event = "BufEnter" },
	{ "gpanders/editorconfig.nvim",    lazy = false },
	{ "simrat39/symbols-outline.nvim", event = { "BufRead" } },
	{
		"RRethy/vim-illuminate",
		event = { "BufRead" },
		config = function()
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
		end,
	},
	{ "nullchilly/fsread.nvim", lazy = false },
	{
		"bloznelis/before.nvim",
		lazy = false,
		config = function()
			local before = require "before"
			before.setup()
		end,
	},
}
