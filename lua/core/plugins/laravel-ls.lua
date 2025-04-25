vim.api.nvim_create_autocmd("FileType", {
	pattern = { "php", "blade" },
	callback = function()
		vim.lsp.start({
			name = "laravel-ls",
			-- cmd = { vim.fn.expand("~") .. "/go/bin/laravel-ls2" },
			cmd = { vim.fn.expand("~") .. "/go/bin/laravel-ls" },

			-- cmd = { vim.fn.expand("~") .. "/g" },
			-- if you want to recompile everytime
			-- the language server is started.
			-- Uncomment this line instead
			-- cmd = { vim.fn.expand("~") .. "/go/bin/laravel-ls/start.sh" },
			-- cmd = { '/path/to/laravel-ls/start.sh' },
			root_dir = vim.fn.getcwd(),
		})
	end
})
