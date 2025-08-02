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
local Plan = function()
	local cwd      = vim.fn.getcwd()
	local filePath = cwd .. "/.plan.md"

	if vim.fn.filereadable(filePath) == 0 then
		local ok, err = pcall(function()
			local fh, ferr = io.open(filePath, "w")
			if not fh then
				error("io.open failed: " .. (ferr or "unknown error"))
			end
			fh:close()
		end)

		if not ok then
			vim.notify(
				"Error creating " .. filePath .. ": " .. tostring(err),
				vim.log.levels.ERROR
			)
			return
		end

		vim.notify("Created file: " .. filePath, vim.log.levels.INFO)
	end

	local buf
	local ok, err = pcall(function()
		buf = vim.fn.bufadd(filePath)
	end)
	if not ok or not buf then
		vim.notify(
			"Error adding buffer for " .. filePath .. ": " .. tostring(err),
			vim.log.levels.ERROR
		)
		return
	end

	ok, err = pcall(function()
		vim.api.nvim_set_current_buf(buf)
	end)
	if not ok then
		vim.notify(
			"Error setting buffer for " .. filePath .. ": " .. tostring(err),
			vim.log.levels.ERROR
		)
		return
	end

	return buf
end


local transparent = false
local ToggleTransparency = function()
	transparent = not transparent
	if transparent then
		vim.cmd [[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE
      hi Pmenu guibg=NONE
      hi PmenuSel guibg=NONE
      hi VertSplit guibg=NONE
      hi StatusLine guibg=NONE
      hi SignColumn guibg=NONE
      hi LineNr guibg=NONE
      hi EndOfBuffer guibg=NONE
    ]]
		vim.notify("✅ Transparency enabled")
	else
		vim.cmd.colorscheme(vim.g.colors_name)
		vim.notify("🚫 Transparency disabled")
	end
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

local LightMode = function()
	require("rose-pine").setup({
		-- dark_variant = "main",
		dim_inactive = {
			enabled = true,
			shade = "dark",
			percentage = 0.15
		},
		disable_background = false,
		variant = "dawn",
		styles = {
			-- transparency = false,
			italic = true,
			bold = true
		}
	})
	vim.cmd.colorscheme "rose-pine"
end

local ZenMode = function()
	vim.cmd.colorscheme "rose-pine"
end
vim.api.nvim_create_user_command("Zen", ZenMode, {})
local UnZen = function()
	vim.cmd.colorscheme "onedark"
end

vim.api.nvim_create_user_command("ToggleTransparency", ToggleTransparency, {})
vim.api.nvim_create_user_command("Cool", UnZen, {})
vim.api.nvim_create_user_command("Light", LightMode, {})
vim.api.nvim_create_user_command("Plan", Plan, {})
-- vim.lsp.handlers["$/progress"] = function() end

vim.api.nvim_create_user_command("Rest", require("kulala").run, {})
vim.api.nvim_create_user_command("RestAll", require("kulala").run_all, {})
vim.api.nvim_create_user_command("RestScratchpad", require("kulala").scratchpad, {})

local map = vim.keymap.set


vim.keymap.set("n", "<leader>ut", ToggleTransparency, { desc = "Toggle Transparency" })
map("n", "<leader>ks", "<cmd>Rest<CR>")
map("n", "<leader>ka", "<cmd>RestAll<CR>")
map("n", "<leader>kb", "<cmd>RestScrathPad<CR>")
