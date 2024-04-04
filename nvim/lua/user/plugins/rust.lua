local utils = require "astronvim.utils"
return {
	-- { import = "astrocommunity.pack.toml" },
	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
		-- init = function() astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "rust_analyzer") end,
		opts = function()
			local adapter
			-- local success, package = pcall(function() return require("mason-registry").get_package "codelldb" end)
			-- if success then
			local package_path = vim.env.HOME .. "/.local/share/nvim/mason/packages"
			local codelldb_path = package_path .. "/codelldb"
			local liblldb_path = codelldb_path .. "/extension/lldb/lib/liblldb"
			local this_os = vim.loop.os_uname().sysname

			-- The path in windows is different
			if this_os:find "Windows" then
				codelldb_path = package_path .. "\\extension\\adapter\\codelldb.exe"
				liblldb_path = package_path .. "\\extension\\lldb\\bin\\liblldb.dll"
			else
				-- The liblldb extension is .so for linux and .dylib for macOS
				liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
			end
			adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
			-- else
			-- 	adapter = require("rust-tools.dap").get_codelldb_adapter()
			-- end

			return { server = require("astronvim.utils.lsp").config "rust_analyzer", dap = { adapter = adapter } }
		end,
		dependencies = {
			{
				"jay-babu/mason-nvim-dap.nvim",
				opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed,
						"codelldb") end,
			},
		},
	},
	{
		"saecki/crates.nvim",
		-- tag = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function() require("crates").setup() end,
		event = { "BufEnter Cargo.toml" },
	},
}
