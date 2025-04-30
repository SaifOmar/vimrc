return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "github/copilot.vim" }, -- or use "zbirenbaum/copilot.lua"
		{ "nvim-lua/plenary.nvim" },
	},
	build = "make tiktoken", -- Only on macOS or Linux
	config = function()
		require("CopilotChat").setup({

		})
	end,
}
