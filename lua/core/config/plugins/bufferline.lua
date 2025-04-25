require("bufferline").setup({
	options = {
		mode = "buffers",
		separator_style = "thihn",
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		-- show_close_icon = false,
		modified_icon = "●",
	},
	highlights = {
		fill = {
			bg = "NONE",
			fg = "NONE",
		},
		background = {
			-- fg = "#666666", -- Dim gray for inactive buffers
			fg = "NONE",
			bg = "NONE",
		},
		buffer_selected = {
			fg = "NONE", -- Your chosen red color for active buffer
			bg = "NONE",
			bold = true,
			italic = false,
			underline = true,
		},
		separator = {
			-- fg = "#666666",
			fg = "NONE",
			bg = "NONE",
		},
		separator_selected = {
			-- fg = "#666666",
			fg = "NONE",
			bg = "NONE",
		},
		modified = {
			-- fg = "#666666",
			fg = "NONE",
			bg = "NONE",
		},
		modified_selected = {
			fg = "NONE",
			bg = "NONE",
			bold = true,
			italic = false,
		},
		indicator_selected = {
			fg = "NONE",
			bg = "NONE",
		},
	}
})

-- Keymaps
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
