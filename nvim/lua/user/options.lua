return {
	opt = {
		-- set to true or false etc.
		relativenumber = true, -- sets vim.opt.relativenumber
		spell = false,     -- sets vim.opt.spell
		signcolumn = "auto", -- sets vim.opt.signcolumn to auto
		backup = false,    -- creates a backup file
		cmdheight = 2,     -- more space in the neovim command line for displaying messages
		conceallevel = 0,  -- so that `` is visible in markdown files
		hlsearch = true,   -- highlight all matches on previous search pattern
		showtabline = 2,   -- always show tabs
		swapfile = false,  -- creates a swapfile
		timeoutlen = 100,  -- time to wait for a mapped sequence to complete (in milliseconds)
		wrap = true,       -- sets vim.opt.wrap
		foldmethod = "expr",
		foldexpr = "nvim_treesitter#foldexpr()",
	},
	g = {
		autoformat_enabled = true,     -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
		cmp_enabled = true,            -- enable completion at start
		autopairs_enabled = true,      -- enable autopairs at start
		diagnostics_enabled = true,    -- enable diagnostics at start
		status_diagnostics_enabled = true, -- enable diagnostics in statusline
		icons_enabled = true,          -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
		ui_notifications_enabled = true, -- disable notifications when toggling UI elements
	},
}
