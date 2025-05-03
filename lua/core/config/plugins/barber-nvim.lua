require('barbar').setup({
	animation = false, -- Disable animations for simplicity
	auto_hide = false, -- Always show bufferline
	tabpages = true, -- Focus on buffers, not tabpages
	icons = {
		buffer_index = false,
		buffer_number = false,
		button = false, -- Hide the close button
		separator = { left = '▎', right = '' }, -- Thin separator style
		modified = { button = '●' }, -- Modified icon
		pinned = { button = '車', filename = true },
		filetype = {
			custom_colors = false, -- Use default colors
			-- Enable file name display
			enabled = true,
			-- Use a custom function to format the file name
			-- name_formatter = function(buf)
			-- 	local name = vim.api.nvim_buf_get_name(buf)
			-- 	return name:match('([^/]+)$') or name
			-- end,
		},
	},
	maximum_padding = 1,
	minimum_padding = 1,
	maximum_length = 30,
	no_name_title = 'No Name',
})
