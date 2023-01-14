local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "html",
  "jdtls",
  "jsonls",
  "solc",
  "sumneko_lua",
  "tflint",
  "terraformls",
  "tsserver",
  "pyright",
  "yamlls",
  "bashls",
  "clangd",
  "rust_analyzer",
  "taplo",
  "zk",
  "lemminx",
  "clangd",
  "gopls",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "jsonls" then
    local jsonls_opts = require "user.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "yamlls" then
    local yamlls_opts = require "user.lsp.settings.yamlls"
    opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  end

  if server == "sumneko_lua" then
    local l_status_ok, lua_dev = pcall(require, "lua-dev")
    if not l_status_ok then
      return
    end
    -- local sumneko_opts = require "user.lsp.settings.sumneko_lua"
    -- opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    -- opts = vim.tbl_deep_extend("force", require("lua-dev").setup(), opts)
    local luadev = lua_dev.setup {
      --   -- add any options here, or leave empty to use the default settings
      -- lspconfig = opts,
      lspconfig = {
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
        --   -- settings = opts.settings,
      },
    }
    lspconfig.sumneko_lua.setup(luadev)
    goto continue
  end

  if server == "tsserver" then
    local tsserver_opts = require "user.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "user.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "solc" then
    local solc_opts = require "user.lsp.settings.solc"
    opts = vim.tbl_deep_extend("force", solc_opts, opts)
  end

  if server == "emmet_ls" then
    local emmet_ls_opts = require "user.lsp.settings.emmet_ls"
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  if server == "zk" then
    local zk_opts = require "user.lsp.settings.zk"
    opts = vim.tbl_deep_extend("force", zk_opts, opts)
  end

  if server == "jdtls" then
    goto continue
  end

  if server == "rust_analyzer" then
    local rust_opts = require "user.lsp.settings.rust"
    -- opts = vim.tbl_deep_extend("force", rust_opts, opts)
    local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
    if not rust_tools_status_ok then
      return
    end

    rust_tools.setup(rust_opts)
    goto continue
  end

  if server == "clangd" then
	-- update offset encoding to utf-16
	local capabilities = require("user.lsp.handlers").capabilities
	capabilities.offsetEncoding = {"utf-16"}
	opts.capabilities = capabilities
  end

  if server == "gopls" then
	local gopls_opts = require "user.lsp.settings.gopls"

	local status_go_ok, ray_go_nvim = pcall(require, "go")
	if not status_go_ok then
		return
	end

	ray_go_nvim.setup({
		goimport = "gopls",
		gofmt = "gofumpt",
		lsp_keymaps = false,
		dap_debug = true,
		dap_debug_gui = true,
		dap_debug_vt = true, -- set to true to enable dap virtual text
		lsp_inlay_hints = {
			enable = false,
		},
		textobjects = true, -- enable default text jobects through treesittter-text-objects
		lsp_diag_virtual_text = { space = 0, prefix = "" },
		lsp_diag_signs = true,
		lsp_diag_update_in_insert = false,
		dap_debug_keymap = false,
	})
	opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end