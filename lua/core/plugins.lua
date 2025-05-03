local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 1 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	{
		"lewis6991/gitsigns.nvim",
	},

	require('core.plugins.barber-nvim'),
	require('core.plugins.noice'),
	require('core.plugins.oil-nvim'),
	require('core.plugins.copilot-chat'),
	require('core.plugins.trouble'),
	require('core.config.plugins.noegen'),
	require('core.plugins.treesitter-playground'),
	require('core.plugins.dadbod'),
	require('core.plugins.laravel-ide-helper'),
	require('core.plugins.auto-session'),
	require('core.plugins.harpoon'),
	require('core.plugins.which-key'),
	require("core.plugins.telescope"),
	require("core.plugins.lau-line"),
	require("core.plugins.buffer-line"),
	require("core.plugins.lazydev"),
	require("core.plugins.nvim-lsp-config"),
	require('core.plugins.conform'),
	require('core.plugins.cmp'),
	require('core.plugins.todo-comments'),
	require('core.plugins.mini-nvim'),
	require('core.plugins.nvim-treesitter'),
	require('core.plugins.venv-selector'),
	require('core.plugins.blade-treesitter'),
	require('core.plugins.nvim-tree'),
	require('core.plugins.neo-test'),
	-- require('core.plugins.neo-tree'),
	-- require('core.plugins.kulala-nvim'),
	require 'kickstart.plugins.lint',
	require("kickstart.plugins.autopairs"),
	-- require 'kickstart.plugins.indent_line',
	{ "numToStr/Comment.nvim" },
	{ "Bilal2453/luvit-meta",     lazy = true },
	{ "akinsho/toggleterm.nvim",  version = "*",      config = true },
	{ "folke/neoconf.nvim" }, -- plugin to manage global and project-local settings.
	{ "theprimeagen/vim-be-good" },
	{ "github/copilot.vim",       enabled = true },
	{ "tpope/vim-fugitive" },
	{ "Mofiqul/vscode.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "sainnhe/gruvbox-material" },
	{ "tiagovla/tokyodark.nvim" },
	{ "olimorris/onedarkpro.nvim" },
	{ "rose-pine/neovim",         name = "rose-pine" },
	{ "catppuccin/nvim",          name = "catppuccin" },

	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"folke/tokyonight.nvim",
		priority = 1001, -- Make sure to load this before all the other start plugins.
		init = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			-- vim.cmd.colorscheme("tokyonight-night")

			-- You can configure highlights by doing something like:
			-- vim.cmd.hi("Comment gui=none")
		end,
	},
	-- { 'navarasu/onedark.nvim' },

}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
require('core.plugins.laravel-ls')
