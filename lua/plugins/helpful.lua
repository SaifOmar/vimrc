return {
	-- Detect tabstop and shiftwidth automatically
	-- markdown-render.nvim
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			completions = { lsp = { enabled = true } },
		},
		cmd = { "RenderMarkdown", "RenderMarkdownStop" },
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("config.lualine")
		end,
	},
	{
		'tpope/vim-fugitive',
		event = "VeryLazy"
	},
	{
		'theprimeagen/vim-be-good',
		cmd = "VimBeGood",
	},
	{
		"tpope/vim-sleuth",
		event = "BufReadPre",
	},

	-- Auto pairs for brackets, quotes, etc.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Linter engine
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		enabled = false,
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint" },
				typescript = { "eslint" },
				-- lua = { "luacheck" },
				python = { "flake8" },
				php = { "phpcs" },
				-- add more filetypes + linters as needed
			}

			vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "TextChanged" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
