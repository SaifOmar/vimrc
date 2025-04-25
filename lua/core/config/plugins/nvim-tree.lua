require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
})

vim.api.nvim_set_keymap('n', '\\\\', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
