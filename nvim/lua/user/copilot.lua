local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	return
end

local status_ok1, copilot_cmp = pcall(require, "copilot_cmp")
if not status_ok1 then
	return
end

copilot.setup({
	cmp = {
		enabled = true,
		method = "getCompletionsCycling",
	},
	panel = { -- no config options yet
		enabled = true,
	},
	suggestion = {
		enabled = true,
		--[[ auto_trigger = true, ]]
	},
	ft_disable = { "markdown", "yaml", "json" },
	-- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
	server_opts_overrides = {
		-- trace = "verbose",
		settings = {
			advanced = {
				-- listCount = 10, -- #completions for panel
				inlineSuggestCount = 3, -- #completions for getCompletions
			},
		},
	},
})

copilot_cmp.setup()