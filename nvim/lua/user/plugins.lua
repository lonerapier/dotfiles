local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim"}) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim"}) -- Useful lua functions used by lots of plugins
	use({ "nvim-lua/popup.nvim"}) -- lua utils
	use({ "christianchiarulli/lua-dev.nvim"})
	use({ "numToStr/Comment.nvim"})
	use({ "JoosepAlviste/nvim-ts-context-commentstring"})
	use({ "kyazdani42/nvim-tree.lua"})
	use({ "akinsho/bufferline.nvim"})
	use({ "moll/vim-bbye"})
	use({ "nvim-lualine/lualine.nvim"})
	use({ "akinsho/toggleterm.nvim"})
	use({ "ahmedkhalf/project.nvim"})
	use({ "lewis6991/impatient.nvim"})
	use({ "lukas-reineke/indent-blankline.nvim"})
	use({ "goolord/alpha-nvim"})
	use({ "folke/which-key.nvim"})

	-- Colorschemes
	use({ "folke/tokyonight.nvim"})
	use({ 'embark-theme/vim', as = 'embark' })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp"}) -- The completion plugin
	use({ "hrsh7th/cmp-buffer"}) -- buffer completions
	use({ "hrsh7th/cmp-path"}) -- path completions
	use({ "saadparwaiz1/cmp_luasnip"}) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp"})
	use({ "hrsh7th/cmp-nvim-lua"})

	-- snippets
	use({ "L3MON4D3/LuaSnip"}) --snippet engine
	use({ "rafamadriz/friendly-snippets"}) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig"}) -- enable LSP
  use({ "williamboman/mason.nvim"})
  use({ "williamboman/mason-lspconfig.nvim"})
	use({ "jose-elias-alvarez/null-ls.nvim"}) -- for formatters and linters
  use({ "simrat39/rust-tools.nvim"}) -- rust tools lsp
  use({ "ray-x/lsp_signature.nvim"}) -- function signatures
  use({ "SmiteshP/nvim-navic"}) -- code statusline
  use({ "RRethy/vim-illuminate"}) -- highlight variables
  use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim"}) -- lsp warnings virtual text
  use({ "Saecki/crates.nvim"})
  use({ "lvimuser/lsp-inlayhints.nvim"})

  -- Code Outline
  use({ "simrat39/symbols-outline.nvim"})

  -- Utility
  use "rcarriga/nvim-notify"
  use "stevearc/dressing.nvim"

	-- Telescope
	use({ "nvim-telescope/telescope.nvim"})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
	})
  use({ "p00f/nvim-ts-rainbow"}) -- brackets rainbow
  use {
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }, -- or require if not used so far
  }

	-- Git
	use({ "lewis6991/gitsigns.nvim"}) -- git signs
  use({ "f-person/git-blame.nvim"}) -- git blame line

  -- Debug Adapter Protocol
  use({ "ravenxrz/DAPInstall.nvim"})
  use({ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} })
  use({ "leoluz/nvim-dap-go"})

  -- Icon
  use({ "kyazdani42/nvim-web-devicons"}) -- dev icons

  -- Editing Support
  use({ "windwp/nvim-autopairs"}) -- auto brackets pairing
  use({ "karb94/neoscroll.nvim"}) -- smooth scrolling
  -- use({ "kylechui/nvim-surround"}) -- editing support, add/change/delete brackets around text
  use({ "petertriho/nvim-scrollbar"}) -- Scroll bar
  use({ "gpanders/editorconfig.nvim"}) -- editorconfig support
  use({ "ggandor/leap.nvim"}) -- better move support
  use({
	"folke/noice.nvim",
	event = "VimEnter",
	requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
  })
  -- copilot
	use {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.copilot"
      end, 100)
    end,
  }
	use({ "zbirenbaum/copilot-cmp"})

	use({ "ray-x/go.nvim"})
	use({ "ray-x/guihua.lua"})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)