local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = { "jsonls", "sumneko_lua" }

lsp_installer.setup({
	-- ensure_installed = servers,
})

for _, server in ipairs(lsp_installer.get_installed_servers()) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server.name)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end

    if server.name == "rust_analyzer" then
      local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
      print(liblldb_path)
      require("rust-tools").setup {
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
                enable = false,
              },
              checkOnSave = {
                commands = "clippy"
              }
            }
          },
        },
        dap = {
          adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
        }
      }
      goto continue
    end
	lspconfig[server.name].setup(opts)
    ::continue::
end
