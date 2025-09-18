-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here
		{
			'saghen/blink.cmp',
			dependencies = { 'rafamadriz/friendly-snippets' },
			version = '1.*',

			---@module 'blink.cmp'
			---@type blink.cmp.Config
			opts = {
				keymap = { preset = 'default' },

				appearance = {
					nerd_font_variant = 'mono'
				},

				completion = { documentation = { auto_show = false } },

				sources = {
					default = { 'lsp', 'path', 'snippets', 'buffer' },
				},

				fuzzy = { implementation = "prefer_rust_with_warning" }
			},
			opts_extend = { "sources.default" }
		}, 
		{
			'https://github.com/neovim/nvim-lspconfig',
			lazy = false,
		},
		{
			'shaunsingh/nord.nvim',
			init = function()
				vim.g.nord_contrast = false
				vim.g.nord_borders = false
				vim.g.nord_disable_background = false
				vim.g.nord_italic = false
				vim.g.nord_uniform_diff_background = false
				vim.g.nord_bold = true

				-- Load the colorscheme
				require('nord').set()
			end,
		},
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' },
			opts = {
				theme = 'auto',
				section_separators = {
					left = '|',
					right = '|',
				},
				component_separators = {
					left = '|',
					right = '|',
				},
			}
		}
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "nord" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('gopls')
vim.diagnostic.config({ virtual_text = true })
