local colors = require('colors.matugen')

local localtheme = {
	normal = {
		a = { fg = colors.on_secondary_container, bg = colors.secondary_container, gui = "bold" }, -- mode indicator
		b = { fg = colors.on_surface, bg = colors.surface_container },       -- branch, diagnostics
		c = { fg = colors.on_surface, bg = colors.surface_container_lowest },           -- filename
	},
	insert = {
		a = { fg = colors.on_primary_container, bg = colors.primary_container, gui = "bold" }, -- mode indicator
		b = { fg = colors.on_surface, bg = colors.surface_container },       -- branch, diagnostics
		c = { fg = colors.on_surface, bg = colors.surface_container_lowest },           -- filename
	},
	visual = {
		a = { fg = colors.on_error_container, bg = colors.error_container, gui = "bold" }, -- mode indicator
		b = { fg = colors.on_surface, bg = colors.surface_container },       -- branch, diagnostics
		c = { fg = colors.on_surface, bg = colors.surface_container_lowest },           -- filename
	},
	replace = {
		a = { fg = colors.on_primary_container, bg = colors.primary_container, gui = "bold" }, -- mode indicator
		b = { fg = colors.on_surface, bg = colors.surface_container },       -- branch, diagnostics
		c = { fg = colors.on_surface, bg = colors.surface_container_lowest },           -- filename
	},
	command = {
		a = { fg = colors.on_primary_container, bg = colors.primary_container, gui = "bold" }, -- mode indicator
		b = { fg = colors.on_surface, bg = colors.surface_container },       -- branch, diagnostics
		c = { fg = colors.on_surface, bg = colors.surface_container_lowest },           -- filename
	},
	inactive = {
		a = { fg = colors.on_primary_container, bg = colors.primary_container, gui = "bold" }, -- mode indicator
		b = { fg = colors.on_surface, bg = colors.surface_container },       -- branch, diagnostics
		c = { fg = colors.on_surface, bg = colors.surface_container_lowest },           -- filename
	},
}

return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	lazy = false,
	opts = {
		options = { section_separators = '', component_separators = '' , theme = localtheme},
	}
}
