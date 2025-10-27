-- matugen generated colours for Neovim
local colors = {
<* for name, value in colors *>
	{{name}} = "{{value.default.hex}}",
<* endfor *>
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
