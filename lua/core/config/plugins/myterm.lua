local window = require("core.config.plugins.window")
local state = {
	floating = {
		buf = -1,
		win = -1,
	}
}
local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = window.open_floating_win { buf = state.floating.buf }
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

vim.api.nvim_create_user_command("TermWin", toggle_terminal, {
})

-- vim.api.nvim_buf_set_keymap(state.floating.buf, "t", "<leader>q", "<C-\\><C-n>:close<CR>",
-- 	{ noremap = true, silent = true })
-- -- In normal mode (after entering terminal normal mode with <C-\\><C-n>), press q to close.
-- vim.api.nvim_buf_set_keymap(state.floating.buf, "n", "q", ":close<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader>tm", ":TermWin<CR>", { noremap = true, silent = true })
