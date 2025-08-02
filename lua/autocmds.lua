-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "javascript", "javascriptreact" },
-- 	callback = function()
-- 		vim.opt_local.shiftwidth = 6
-- 		vim.opt_local.tabstop = 6
-- 		vim.opt_local.softtabstop = 6
-- 		vim.opt_local.expandtab = true
-- 	end,
-- })
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "php", "blade" },
-- 	callback = function()
-- 		vim.lsp.start({
-- 			name = "laravel-ls",
-- 			-- cmd = { vim.fn.expand("~") .. "/go/bin/laravel-ls2" },
-- 			cmd = { vim.fn.expand("~") .. "/go/bin/laravel-ls" },
--
-- 			-- cmd = { vim.fn.expand("~") .. "/g" },
-- 			-- if you want to recompile everytime
-- 			-- the language server is started.
-- 			-- Uncomment this line instead
-- 			-- cmd = { vim.fn.expand("~") .. "/go/bin/laravel-ls/start.sh" },
-- 			-- cmd = { '/path/to/laravel-ls/start.sh' },
-- 			root_dir = vim.fn.getcwd(),
-- 		})
-- 	end
-- })

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.hl.on_yank({ higroup = 'Visual', timeout = 150 })
	end
})
