return {
	{ "folke/tokyonight.nvim",            lazy = false },
	-- { "embark-theme/vim",                 name = "embark", lazy = false },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = false },
	{ "rebelot/kanagawa.nvim",            lazy = false },
	{ "EdenEast/nightfox.nvim",           lazy = false },
	{ "jacoborus/tender.vim",             lazy = false },
	{ "savq/melange",                     lazy = false },
	{ "sainnhe/sonokai",                  lazy = false },
	{ "sainnhe/everforest",               lazy = false },
	{ "rose-pine/neovim",                 lazy = false },
	{ "ellisonleao/gruvbox.nvim",         lazy = false },
	{ "Mofiqul/dracula.nvim",             lazy = false },
	{
		"mcchrish/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
	},
	-- Catppuccin
	{
		"catppuccin/nvim",
		lazy = false,
		-- opt = false,
		name = "catppuccin",
		config = function()
			-- latte, frappe, macchiato, mocha
			-- vim.g.catppuccin_flavour = "mocha"
			-- local colors = require("catppuccin.palettes").get_palette()
			require("catppuccin").setup {
				-- transparent_background = true,
				term_colors = true,
				styles = {
					comments = { "italic" },
					functions = { "italic", "bold" },
					keywords = { "italic" },
				},
			}
		end,
	},
	{ "NLKNguyen/papercolor-theme", lazy = false },
	{ "sainnhe/everforest",         lazy = false },
	{ "AstroNvim/astrotheme",       lazy = false },
}
