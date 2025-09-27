vim.lsp.config('rust_analyzer', {
	filetypes = {'rs'}
})
vim.lsp.enable('gopls')
vim.diagnostic.config({ virtual_text = true })
