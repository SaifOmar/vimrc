return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	config = function()
		require("venv-selector").setup({
			settings = {
				auto_refresh = false,
				search_venv_managers = false,
				path = "E:\\dev\\django",

			},
		})
	end,
	keys = {
		{ "<leader>vv", "<cmd>VenvSelect<cr>" },
		{ '<leader>vc', '<cmd>VenvSelectCached<cr>' },
	},
}
