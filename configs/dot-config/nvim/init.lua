-- Setup lazy.nvim
-- require("lazy").setup({
-- 	spec = {
-- 		-- add your plugins here
-- 		{
-- 			'https://github.com/neovim/nvim-lspconfig',
-- 			lazy = false,
-- 		},
-- 		{
-- 			'shaunsingh/nord.nvim',
-- 			init = function()
-- 				vim.g.nord_contrast = false
-- 				vim.g.nord_borders = false
-- 				vim.g.nord_disable_background = false
-- 				vim.g.nord_italic = false
-- 				vim.g.nord_uniform_diff_background = false
-- 				vim.g.nord_bold = true
--
-- 				-- Load the colorscheme
-- 				require('nord').set()
-- 			end,
-- 		},
-- 		{
-- 			'nvim-lualine/lualine.nvim',
-- 			dependencies = { 'nvim-tree/nvim-web-devicons' },
-- 			opts = {
-- 				theme = 'auto',
-- 				section_separators = {
-- 					left = '|',
-- 					right = '|',
-- 				},
-- 				component_separators = {
-- 					left = '|',
-- 					right = '|',
-- 				},
-- 			}
-- 		}
-- 	},
-- })

require("config.lazy")

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

