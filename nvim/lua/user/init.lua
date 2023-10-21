local config = {
	colorscheme = "astrolight",
	diagnostics = {
		virtual_lines = false,
		virtual_text = false,
		underline = true,
		update_in_insert = true,
		severity_sort = true,
	},
	lsp = {
		-- enable servers that you already have installed without mason
		servers = {
			-- Nomic solidity LSP
			-- "nomic_solidity",
		},
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					"solidity",
					"go",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- "sumneko_lua",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--   return true
			-- end
		}, -- Configure require("lazy").setup() options
		setup_handlers = {
			-- first function changes the default setup handler
			-- function(server, opts)
			--   require("lspconfig")[server].setup(opts)
			-- end,
			-- -- keys for a specific server name will be used for that LSP
			-- sumneko_lua = function(server, opts)
			--   -- custom sumneko_lua setup handler
			--   require("lspconfig")["sumneko_lua"].setup(opts)
			-- end,
			rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
			clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
		},
		config = {
			clangd = {
				capabilities = {
					offsetEncoding = "utf-8",
				},
			},
		},
	},
	lazy = {
		defaults = { lazy = true },
		performance = {
			rtp = {
				-- customize default disabled vim plugins
				disabled_plugins = {
					"tohtml",
					"gzip",
					"matchit",
					"zipPlugin",
					"netrwPlugin",
					"tarPlugin",
					"matchparen",
				},
			},
		},
	},
	-- Custom icons
	icons = {
		VimIcon = "",
	},
	polish = function()
		-- Set up notify background color (Fixes warning)
		require("notify").setup {
			background_colour = "#000000",
		}

		require("nvim-treesitter.configs").setup {
			highlight = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
			},
		}

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
	end,
}

return config
