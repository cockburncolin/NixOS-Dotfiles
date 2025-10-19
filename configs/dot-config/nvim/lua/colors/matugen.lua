-- matugen generated colours for Neovim
local colors = {

	background = "#131413",

	error = "#ffb4ab",

	error_container = "#93000a",

	inverse_on_surface = "#303030",

	inverse_primary = "#51625a",

	inverse_surface = "#e4e2e0",

	on_background = "#e4e2e0",

	on_error = "#690005",

	on_error_container = "#ffdad6",

	on_primary = "#24342d",

	on_primary_container = "#b3c6bc",

	on_primary_fixed = "#0f1f18",

	on_primary_fixed_variant = "#3a4a43",

	on_secondary = "#2b322e",

	on_secondary_container = "#dfe6e0",

	on_secondary_fixed = "#171d1a",

	on_secondary_fixed_variant = "#424845",

	on_surface = "#e4e2e0",

	on_surface_variant = "#c2c8c3",

	on_tertiary = "#412b2b",

	on_tertiary_container = "#dbbab9",

	on_tertiary_fixed = "#291617",

	on_tertiary_fixed_variant = "#594141",

	outline = "#8c928e",

	outline_variant = "#424845",

	primary = "#b8cbc1",

	primary_container = "#26362f",

	primary_fixed = "#d4e7dc",

	primary_fixed_dim = "#b8cbc1",

	scrim = "#000000",

	secondary = "#c2c8c3",

	secondary_container = "#444b47",

	secondary_fixed = "#dee4df",

	secondary_fixed_dim = "#c2c8c3",

	shadow = "#000000",

	source_color = "#26362f",

	surface = "#131413",

	surface_bright = "#393938",

	surface_container = "#1f201f",

	surface_container_high = "#292a29",

	surface_container_highest = "#343534",

	surface_container_low = "#1b1c1b",

	surface_container_lowest = "#0d0e0e",

	surface_dim = "#131413",

	surface_tint = "#b8cbc1",

	surface_variant = "#424845",

	tertiary = "#e0bfbe",

	tertiary_container = "#432d2d",

	tertiary_fixed = "#fedad9",

	tertiary_fixed_dim = "#e0bfbe",

}

vim.cmd(string.format("hi Normal guifg=%s guibg=%s", colors.on_background, colors.background))
vim.cmd(string.format("hi Cursor guifg=%s guibg=%s", colors.background, colors.primary))
vim.cmd(string.format("hi CursorLine guibg=%s", colors.surface_container_low))
vim.cmd(string.format("hi Visual guibg=%s", colors.surface_container_high))

-- Comments
vim.cmd(string.format("hi Comment guifg=%s gui=italic", colors.surface_variant))

-- Constants, Types, Functions
vim.cmd(string.format("hi Constant guifg=%s", colors.tertiary))
vim.cmd(string.format("hi Identifier guifg=%s", colors.primary_fixed))
vim.cmd(string.format("hi Statement guifg=%s", colors.error))
vim.cmd(string.format("hi Type guifg=%s", colors.secondary))
vim.cmd(string.format("hi Function guifg=%s", colors.primary_container))
vim.cmd(string.format("hi String guifg=%s", colors.inverse_primary))

return colors
