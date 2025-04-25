require("rose-pine").setup({
	variant = "moon",
	styles = {
		transparency = true,
		italic = false,
		bold = false
	}
})
require("onedarkpro").setup({
	colors = {},       -- Override default colors or create your own
	highlights = {},   -- Override default highlight groups or create your own
	styles = {         -- For example, to apply bold and italic, use "bold,italic"
		types = "italic", -- Style that is applied to types
		methods = "italic", -- Style that is applied to methods
		numbers = "NONE", -- Style that is applied to numbers
		strings = "italic", -- Style that is applied to strings
		comments = "italic", -- Style that is applied to comments
		keywords = "italic", -- Style that is applied to keywords
		constants = "bold", -- Style that is applied to constants
		functions = "italic", -- Style that is applied to functions
		operators = "NONE", -- Style that is applied to operators
		variables = "italic", -- Style that is applied to variables
		parameters = "italic", -- Style that is applied to parameters
		conditionals = "italic", -- Style that is applied to conditionals
		virtual_text = "italic", -- Style that is applied to virtual text
	},
	filetypes = {      -- Override which filetype highlight groups are loaded
		c = true,
		comment = true,
		go = true,
		html = true,
		java = true,
		javascript = true,
		json = true,
		lua = true,
		markdown = true,
		php = true,
		python = true,
		ruby = true,
		rust = true,
		scss = true,
		toml = true,
		typescript = true,
		typescriptreact = true,
		vue = true,
		xml = true,
		yaml = true,
	},
	plugins = { -- Override which plugin highlight groups are loaded
		aerial = true,
		barbar = true,
		blink_cmp = true,
		codecompanion = true,
		copilot = true,
		dashboard = true,
		flash_nvim = true,
		gitgraph_nvim = true,
		gitsigns = true,
		hop = true,
		indentline = true,
		leap = true,
		lsp_saga = true,
		lsp_semantic_tokens = true,
		marks = true,
		mini_diff = true,
		mini_icons = true,
		mini_indentscope = true,
		mini_test = true,
		neotest = true,
		neo_tree = true,
		nvim_cmp = true,
		nvim_bqf = true,
		nvim_dap = true,
		nvim_dap_ui = true,
		nvim_hlslens = true,
		nvim_lsp = true,
		nvim_navic = true,
		nvim_notify = true,
		nvim_tree = true,
		nvim_ts_rainbow = true,
		op_nvim = true,
		packer = true,
		persisted = true,
		polygot = true,
		rainbow_delimiters = true,
		render_markdown = true,
		startify = true,
		telescope = true,
		toggleterm = true,
		treesitter = true,
		trouble = true,
		vim_ultest = true,
		which_key = true,
		vim_dadbod_ui = true,
	},

	options = {
		cursorline = false,  -- Use cursorline highlighting?
		transparency = true, -- Use a transparent background?
		terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
		lualine_transparency = true, -- Center bar transparency?
		highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
	}
})
-- require("onedark").setup({
-- 	variant = "darker",
-- 	transparent = true,
-- 	term_colors = true,
-- 	code_style = {
-- 		comments = 'italic',
-- 		keywords = 'italic',
-- 		functions = 'none',
-- 		strings = 'none',
-- 		variables = 'italic'
-- 	}
-- }
-- )

require("tokyodark").setup({
	opts = {
		transparent_background = true,
	},
	config = function(_, opts)
		require("tokyodark").setup(opts) -- calling setup is optional
		vim.cmd [[colorscheme tokyodark]]
	end,
})


local c = require('vscode.colors').get_colors()
require('vscode').setup({
	-- Alternatively set style in setup
	-- style = 'light'

	-- Enable transparent background
	transparent = true,

	-- Enable italic comment
	italic_comments = false,

	-- Underline `@markup.link.*` variants
	underline_links = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		vscLineNumber = '#FFFFFF',
	},

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
	}
})





vim.cmd.colorscheme "onedark"
-- vim.cmd.colorscheme "vscode"
-- vim.cmd.colorscheme "tokyodark"
-- vim.cmd.colorscheme "habamax"
-- vim.cmd.colorscheme "gruvbox-material"
-- vim.cmd.colorscheme "gruvbox"
-- vim.cmd.colorscheme "catppuccin"
