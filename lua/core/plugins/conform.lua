return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Increase timeout for blade files specifically
			if vim.bo[bufnr].filetype == "blade" then
				return {
					timeout_ms = 60000, -- 60 seconds for blade files
					lsp_format = "fallback"
				}
			end

			local disable_filetypes = { c = true, cpp = true }
			local lsp_format_opt = disable_filetypes[vim.bo[bufnr].filetype] and "never" or
			    "fallback"
			return {
				timeout_ms = 2000,
				lsp_format = lsp_format_opt,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			json = { "prettier" },
			blade = {
				"blade-formatter" -- Try blade-formatter instead of prettier
				-- Fallback to prettier if blade-formatter doesn't work
				-- {
				-- 	"prettier",
				-- 	args = {
				-- 		"--plugin=prettier-plugin-blade",
				-- 		"--parser=blade",
				-- 		"--print-width=120", -- Increased line width for better performance
				-- 		"--stdin-filepath",
				-- 		"$FILENAME"
				-- 	}
				-- }
			},
			javascript = { "prettier", "prettierd", stop_after_first = true },
		},
	},
}
