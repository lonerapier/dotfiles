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
	},
	{ "famiu/bufdelete.nvim",       event = "BufEnter" },
	{ "gpanders/editorconfig.nvim", lazy = false },
	{
		"simrat39/rust-tools.nvim",
		-- Lazy = false,
		ft = { "rs", "toml" },
	},
	{ "simrat39/symbols-outline.nvim", event = { "BufRead" } },
	{
		"saecki/crates.nvim",
		-- tag = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function() require("crates").setup() end,
		event = { "BufEnter Cargo.toml" },
	},
	{ "p00f/nvim-ts-rainbow",          lazy = false },
	{
		"RRethy/vim-illuminate",
		event = { "BufRead" },
		config = function()
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
		end,
	},
	{ "nullchilly/fsread.nvim",           lazy = false },
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup {
				lsp_inlay_hints = {
					enable = false,
				},
			}
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
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
