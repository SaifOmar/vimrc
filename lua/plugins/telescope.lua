return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	lazy = true,
	branch = "1.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1 or vim.fn.executable("make") == 2
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-tree/nvim-web-devicons",               enabled = vim.g.have_nerd_font },
	},
	opts = {
		defaults = {
			file_ignore_patterns = { "node_modules", ".git/" },
			prompt_prefix = "> ",
			selection_caret = "> ",
			path_display = { "smart" },
			find_command = { "fd", "--type", "f", "--hidden", "--follow", "--exclude", ".git" },
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup(opts)

		-- Load extensions
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "fd")
		pcall(telescope.load_extension, "file_browser")
		pcall(telescope.load_extension, "ui-select")

		-- Keymaps
		local map = vim.keymap.set
		map("n", "<leader>fb", ":Telescope file_browser<CR>")
		map("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles" })
		map("n", "<leader>fw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		map("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 11,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		map("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		map("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
