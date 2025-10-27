-- matugen generated colours for Neovim
local colors = {

	background = "#111318",

	error = "#ffb4ab",

	error_container = "#93000a",

	inverse_on_surface = "#2e3035",

	inverse_primary = "#295ea5",

	inverse_surface = "#e2e2e8",

	on_background = "#e2e2e8",

	on_error = "#690005",

	on_error_container = "#ffdad6",

	on_primary = "#003062",

	on_primary_container = "#000000",

	on_primary_fixed = "#001b3d",

	on_primary_fixed_variant = "#00468a",

	on_secondary = "#20314b",

	on_secondary_container = "#d2e1ff",

	on_secondary_fixed = "#091c35",

	on_secondary_fixed_variant = "#374763",

	on_surface = "#e2e2e8",

	on_surface_variant = "#c2c6d2",

	on_tertiary = "#442c00",

	on_tertiary_container = "#000000",

	on_tertiary_fixed = "#281800",

	on_tertiary_fixed_variant = "#614000",

	outline = "#8c919c",

	outline_variant = "#424751",

	primary = "#a8c8ff",

	primary_container = "#6291db",

	primary_fixed = "#d6e3ff",

	primary_fixed_dim = "#a8c8ff",

	scrim = "#000000",

	secondary = "#b6c7e9",

	secondary_container = "#374763",

	secondary_fixed = "#d6e3ff",

	secondary_fixed_dim = "#b6c7e9",

	shadow = "#000000",

	source_color = "#4778c0",

	surface = "#111318",

	surface_bright = "#37393e",

	surface_container = "#1d2024",

	surface_container_high = "#282a2f",

	surface_container_highest = "#33353a",

	surface_container_low = "#191c20",

	surface_container_lowest = "#0c0e13",

	surface_dim = "#111318",

	surface_tint = "#a8c8ff",

	surface_variant = "#424751",

	tertiary = "#fbbb54",

	tertiary_container = "#be8622",

	tertiary_fixed = "#ffddb0",

	tertiary_fixed_dim = "#fbbb54",

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
