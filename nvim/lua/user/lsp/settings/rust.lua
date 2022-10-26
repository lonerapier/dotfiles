local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
return {
  tools = {
    -- autoSetHints = false,
    on_initialized = function()
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
        pattern = { "*.rs" },
        callback = function()
          vim.lsp.codelens.refresh()
        end,
      })
    end,
  },
	server = {
	  on_attach = require("user.lsp.handlers").on_attach,
	  capabilities = require("user.lsp.handlers").capabilities,
	  settings = {
		["rust-analyzer"] = {
		  completion = {
			postfix = {
			  enable = false,
			},
		  },
		  lens = {
			enable = true,
		  },
		  checkOnSave = {
			command = "clippy",
		  },
		  inlayHints = {
			closureReturnTypeHints = {
			  enable = true,
			},
			lifetimeElisionHints = {
			  enable = true,
			  useParameterNames = true,
			},
			bindingModeHints = {
			  enable = true,
			},
			maxLength = 100,
		  },
		},
	  },
	},
	dap = {
	  adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
	},
}