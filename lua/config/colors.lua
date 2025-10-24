-- vim.cmd.colorscheme "catppuccin"
local theme_file = vim.fn.stdpath("config") .. "/lua/plugins/theme.lua"
local default_theme = "rose-pine-moon"

local function parse_theme(content)
	local theme = content:match('colorscheme%s*=%s*"([^"]+)"')
	return theme
end

local function apply_theme()
	local f = io.open(theme_file, "r")
	if not f then
		return
	end
	local content = f:read("*a")
	f:close()
	if content then
		local theme = parse_theme(content)
		if theme then
			vim.schedule(function()
				pcall(vim.cmd.colorscheme, theme)
			end)
		else
			vim.schedule(function()
				pcall(vim.cmd.colorscheme, default_theme)
			end)
			vim.notify("Could not find theme resorting to default", vim.log.levels.INFO)
		end
	end
	require("plugin.after.transparency")
end

apply_theme()
