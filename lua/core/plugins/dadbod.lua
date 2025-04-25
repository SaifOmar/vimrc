return {
	'kristijanhusak/vim-dadbod-ui',
	dependencies = {
		{ 'tpope/vim-dadbod',                     lazy = true },
		{ 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
	},
	cmd = {
		'DBUI',
		'DBUIToggle',
		'DBUIAddConnection',
		'DBUIFindBuffer',
	},
	init = function()
		-- Your DBUI configuration
		vim.keymap.set("n", "<leader>db", "<cmd>DBUI<CR>", { desc = "Open DBUI" })
		vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Toggle DBUI" })
		vim.keymap.set("n", "<leader>dbf", "<cmd>DBUIFindBuffer<CR>", { desc = "Find DBUI Buffer" })
		vim.keymap.set("n", "<leader>dbc", "<cmd>DBUIAddConnection<CR>", { desc = "Add DBUI Connection" })
		vim.keymap.set("n", "<leader>dbq", "<cmd>DBUIQuit<CR>", { desc = "Quit DBUI" })
		vim.g.db_ui_use_nerd_fonts = 1
	end,
}
