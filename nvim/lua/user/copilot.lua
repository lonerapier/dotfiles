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
		auto_refresh = true,
		keymap = {
			jump_prev = "[[",
			jump_next = "]]",
			accept = "<CR>",
			refresh = "gr",
			open = "<M-CR>",
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 50,
		keymap = {
			accept = "<M-l>",
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	ft_disable = { "yaml", "json", "toml" },
	--[[ server_opts_overrides = { ]]
	--[[ 	trace = "verbose", ]]
	--[[ 	settings = { ]]
	--[[ 		advanced = { ]]
	--[[ 			listCount = 10, -- #completions for panel ]]
	--[[ 			inlineSuggestCount = 3, -- #completions for getCompletions ]]
	--[[ 		}, ]]
	--[[ 	}, ]]
	--[[ }, ]]
})

copilot_cmp.setup()