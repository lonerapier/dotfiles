-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
return {
	n = {
		["<S-h>"] = { ":bprevious<CR>", desc = "left buffer" },
		["<S-l>"] = { ":bnext<CR>", desc = "right buffer" },

		-- Move text up and down
		["<A-j>"] = { "<Esc>:m .+1<CR>==gi", desc = "move text down" },
		["<A-k>"] = { "<Esc>:m .-2<CR>==gi", desc = "move text up" },

		-- Close buffers
		["<S-q>"] = { "<cmd>Bdelete<CR>" },

		-- splits
		["<leader>v"] = { "<cmd>vsplit<cr>", desc = "vertical split" },
		["<leader>h"] = { "<cmd>split<cr>", desc = "horizontal split" },
		["<leader>o"] = { "<cmd>SymbolsOutline<cr>", desc = "Outline" },

		-- Trouble
		["<leader>x"] = { desc = "Trouble" },
		["<leader>xx"] = { "<cmd>TroubleToggle<cr>", desc = "Trouble toggle" },
		["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble Workspace diagnostics" },
		["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble document diagnostics" },
		["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble quickfix" },
		["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Trouble loclist" },
		["<leader>xr"] = { "<cmd>TroubleToggle lsp_references<cr>", desc = "Trouble lsp references" },
	},
	v = {
		-- Stay in indent mode
		["<"] = { "<gv" },
		[">"] = { ">gv" },

		-- Move text up and down
		["<A-j>"] = { ":m .+1<CR>==", desc = "move text down" },
		["<A-k>"] = { ":m .-2<CR>==", desc = "move text up" },

		-- Better paste
		["p"] = { '"_dP' },
	},
	x = {
		-- Move text up and down
		["J"] = { ":move '>+1<CR>gv-gv" },
		["K"] = { ":move '<-2<CR>gv-gv" },
		["<A-j>"] = { ":move '>+1<CR>gv-gv" },
		["<A-h>"] = { ":move '<-2<CR>gv-gv" },
	},
}
