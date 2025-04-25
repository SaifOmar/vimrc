require("toggleterm").setup {
	autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
}
--
--
vim.api.nvim_set_keymap('n', '<leader>tl', ':ToggleTerm direction=horizontal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm direction=tab<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', ':ToggleTermToggleAll<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-b>', [[<C-\><C-n>:ToggleTermToggleAll<CR>]], { noremap = true, silent = true })
