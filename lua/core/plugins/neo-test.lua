return {
	'nvim-neotest/neotest',
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		'V13Axel/neotest-pest',
	},
	config = function()
		require('neotest').setup({
			discovery = {
				concurrent = 0
			}, -- Reduce from default 24
			running = {
				concurrent = false
			},
			adapters = {
				require('neotest-pest'),
			}
		})
	end
}
