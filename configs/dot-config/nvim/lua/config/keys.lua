local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap('v', '<', '<gv', default_opts)
keymap('v', '>', '>gv', default_opts)
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)
keymap('n', '<Leader>bk', '<cmd>bd<cr>', { noremap = true, silent = true, desc = 'Kill current buffer' })
keymap('n', '<Leader>bp', '<cmd>bp<cr>', { noremap = true, silent = true, desc = 'Previous buffer' })
keymap('n', '<Leader>bn', '<cmd>bn<cr>', { noremap = true, silent = true, desc = 'Next buffer' })
