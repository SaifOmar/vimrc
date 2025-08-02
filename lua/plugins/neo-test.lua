return {
	'nvim-neotest/neotest',
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		'V13Axel/neotest-pest',
		'nvim-neotest/neotest-jest',
		-- 'olimorris/neotest-phpunit'
	},
	event = "VeryLazy",
	enabled = true,
	config = function()
		require('neotest').setup({
			adapters = {
				require('neotest-pest'),
				-- require('neotest-jest'),
				-- require('neotest-phpunit'),
			}
		})

		vim.keymap.set('n', '<leader>tn', function() require('neotest').run.run() end,
			{ desc = "test the nearest test" })
		vim.keymap.set('n', '<leader>ta', function() require('neotest').run.run(vim.fn.expand('%')) end,
			{ desc = "test the entire file" })
	end,
}
