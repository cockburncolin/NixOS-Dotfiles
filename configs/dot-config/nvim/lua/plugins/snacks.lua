return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		dim = { enabled = true },
		explorer = { enabled = true },
		indent = { 
			enabled = true, 
			animate = { enabled = false },
		},
		input = { enabled = true },
		lazygit = { enabled = true },
		picker = {
			enabled = true,
			layout = {
				preset = "telescope",
			},
		},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},

	keys = {
		{'<leader>g', function() Snacks.lazygit() end, desc = 'Lazygit'},
		-- Pickers
		{'<leader>.', function() Snacks.picker.smart() end, desc = 'Find Files'},
		{'<leader>bi', function() Snacks.picker.buffers() end, desc = 'Search Buffers'},
		{'<leader>fg', function() Snacks.picker.git_files() end, desc = 'Find Git Files'},
		{'<leader>fp', function() Snacks.picker.projects() end, desc = 'Projects'},
		{'<leader>fr', function() Snacks.picker.recent() end, desc = 'Recent'},
		{'<leader>:', function() Snacks.picker.command_history() end, desc = 'Command History' },
		{'<leader>n', function() Snacks.picker.notifications() end, desc = 'Notification History'},
		{'<leader>e', function() Snacks.explorer() end, desc = 'File Explorer'},
		{'<leader>h', function() Snacks.picker.help() end, desc = 'Search Help'},
		{'<leader>m', function() Snacks.picker.man() end, desc = 'Search Man Pages'},
		-- LSP
		{'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition'},
		{'gD', function() Snacks.picker.lsp_declarations() end, desc = 'Goto Declaration'},
		{'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References'},
		{'gI', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementation'},
		{'gy', function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto T[y]pe Definition'},
		{'<leader>ss', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols'},
		{'<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols'},
	},
}
