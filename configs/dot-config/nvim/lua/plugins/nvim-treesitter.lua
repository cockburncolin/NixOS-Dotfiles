return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"rust",
			"markdown",
			"markdown_inline"
		},
	},
}
