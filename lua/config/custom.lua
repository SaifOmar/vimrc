local OpenCheatSheet = function()
	if vim.fn.has("win32") == 1 then
		vim.notify("Why are you using windows you little sucker", vim.log.levels.ERROR)
		return
	end
	local path = vim.fn.expand("~") .. "/personal/cheat_sheet.md"
	local dir = vim.fn.fnamemodify(path, ":h")

	-- ensure the directory exists
	if vim.fn.isdirectory(dir) == 0 then
		local success, err = pcall(vim.fn.mkdir, dir, "p")
		if not success then
			vim.notify("Failed to create directory " .. dir .. ": " .. err, vim.log.levels.ERROR)
			return
		end
	end

	-- check if the file exists
	if vim.fn.filereadable(path) == 0 then
		vim.notify("Cheat sheet not found at " .. path .. ", creating it...", vim.log.levels.WARN)
		local file = io.open(path, "w")
		if not file then
			vim.notify("Failed to create cheat sheet at " .. path, vim.log.levels.ERROR)
			return
		end
		file:close()
		vim.notify("Cheat sheet created at " .. path, vim.log.levels.INFO)
	end

	-- open the file in a buffer
	local buf = vim.fn.bufadd(path)
	vim.api.nvim_set_current_buf(buf)
	return buf
end

-- local OpenWeztermConfig = function()
-- 	local path = ''
-- 	local is_wsl = vim.fn.has("wsl") == 1
-- 	local is_linux = vim.fn.has("linux") == 1
-- 	if is_wsl then
-- 		path = "/mnt/c/Users/saife/.wezterm.lua"
-- 	elseif is_linux then
-- 		path = "/home/saif/.wezterm.lua"
-- 	else
-- 		path = "C:\\Users\\saife\\.wezterm.lua"
-- 	end
--
-- 	local buf = vim.fn.bufadd(path)
-- 	vim.fn.bufload(buf)
-- 	vim.api.nvim_set_current_buf(buf)
--
-- 	-- local window = require("core.config.plugins.window")
-- 	-- local todo_window = window.open_floating_win({
-- 	-- 	buf = buf,
-- 	-- })
-- 	-- return buf
-- end
-- vim.api.nvim_create_user_command("WeztermConfig", OpenWeztermConfig, {})
vim.api.nvim_create_user_command("Cheat", OpenCheatSheet, {})


local ZenMode = function()
	vim.cmd.colorscheme "rose-pine"
end
vim.api.nvim_create_user_command("Zen", ZenMode, {})
local UnZen = function()
	vim.cmd.colorscheme "onedark"
end
vim.api.nvim_create_user_command("Cool", UnZen, {})
-- vim.lsp.handlers["$/progress"] = function() end

vim.api.nvim_create_user_command("Rest", require("kulala").run, {})
vim.api.nvim_create_user_command("RestAll", require("kulala").run_all, {})
vim.api.nvim_create_user_command("RestScratchpad", require("kulala").scratchpad, {})

local map = vim.keymap.set

map("n", "<leader>ks", "<cmd>Rest<CR>")
map("n", "<leader>ka", "<cmd>RestAll<CR>")
map("n", "<leader>kb", "<cmd>RestScrathPad<CR>")
