require('lualine').setup {
	sections = {
		lualine_c = {
			'filename',
		},
		-- show time to the far right side of the screen
		-- y and x will be ther right but will go instead of something (I think)
		lualine_z = {
			'location',
			{ function() return os.date('%H:%M') end },
		},
	},
	options = {
		theme = {
			normal = { c = { bg = nil } },
			insert = { c = { bg = nil } },
			visual = { c = { bg = nil } },
			replace = { c = { bg = nil } },
			command = { c = { bg = nil } },
			inactive = { c = { bg = nil } }
		},
	},
}
