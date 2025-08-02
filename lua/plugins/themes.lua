return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		config = function()
			require("rose-pine").setup({
				dark_variant = "main",
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.15
				},
				-- disable_background = true,
				variant = "dawn",
				styles = {
					-- transparency = true,
					italic = true,
					bold = true
				}
			})
		end
	},
	{ 'projekt0n/github-nvim-theme', name = 'github-theme' },
	{
		"Mofiqul/vscode.nvim",
		config = function()
			local c = require('vscode.colors').get_colors()
			require('vscode').setup({
				-- Alternatively set style in setup
				-- style = 'light'

				-- Enable transparent background
				-- transparent = true,

				-- Enable italic comment
				italic_comments = false,

				-- Underline `@markup.link.*` variants
				underline_links = true,

				-- Disable nvim-tree background color
				-- disable_nvimtree_bg = true,

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
		end
	},
	{
		"ellisonleao/gruvbox.nvim",
	},
	{ "sainnhe/gruvbox-material",
	},
	{ "tiagovla/tokyodark.nvim",

	},
	{
		"olimorris/onedarkpro.nvim",
		config = function()
			require("onedarkpro").setup({
				colors = {}, -- Override default colors or create your own
				highlights = {}, -- Override default highlight groups or create your own
				styles = { -- For example, to apply bold and italic, use "bold,italic"
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
				options = {
					cursorline = false, -- Use cursorline highlighting?
					-- transparency = true, -- Use a transparent background?
					terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
					lualine_transparency = true, -- Center bar transparency?
					highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
				}
			})
		end
	},
	{
		"catppuccin/nvim",
		-- name =  "catppuccin"
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				-- transparent_background = false,
			})
		end
	},
	{
		"folke/tokyonight.nvim",
	},
}
