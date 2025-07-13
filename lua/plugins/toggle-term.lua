return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy", -- optional: lazy load at a safe time
	config = function()
		require("toggleterm").setup()

		local opts = { noremap = true, silent = true }

		-- Normal mode mappings
		vim.keymap.set("n", "<leader>tl", ":ToggleTerm direction=horizontal<CR>", opts)
		vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", opts)
		vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", opts)
		vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=tab<CR>", opts)
		vim.keymap.set("n", "<C-b>", ":ToggleTermToggleAll<CR>", opts)

		-- Terminal mode mapping (escape to normal then toggle)
		vim.keymap.set("t", "<C-b>", [[<C-\><C-n>:ToggleTermToggleAll<CR>]], opts)
	end,
}
