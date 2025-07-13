return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "github/copilot.vim" }, -- or use "zbirenbaum/copilot.lua"
		{ "nvim-lua/plenary.nvim" },
	},
	enabled = false,
	event = "VeryLazy",
	build = "make tiktoken", -- Only on macOS or Linux
	config = function()
		local chat = require("CopilotChat")
		vim.keymap.set('n', '<leader>co', chat.toggle, { noremap = true });
		vim.keymap.set('n', '<leader>cm', chat.select_model, { noremap = true });
	end,
}
