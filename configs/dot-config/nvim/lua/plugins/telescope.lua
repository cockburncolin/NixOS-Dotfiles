return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{"<leader>.",  "<cmd>Telescope find_files<cr>", desc = "Find Files"},
		{"<leader>h",  "<cmd>Telescope help_tags<cr>",  desc = "Search help"},
		{"<leader>bi", "<cmd>Telescope buffers<cr>",    desc = "List Buffers"},
	},
}
