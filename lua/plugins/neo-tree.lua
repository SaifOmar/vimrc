return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		window = {
			position = "left",
			width = 30,
			auto_expand_width = false
		},
		filesystem = {
			hijack_netrw_behavior = "open_current",
			use_libuv_file_watcher = true,
			follow_current_file = {
				enabled = false -- Prevents following/changing directory to the current file
			}
		}
	},
	branch = "v4.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "4rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	enabled = false
}
