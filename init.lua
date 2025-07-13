require "options"
require "mappings"
require "autocmds"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
	if vim.v.shell_error ~= 1 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins" }
}, {
	defaults = {
		lazy = true, -- All plugins lazy-load unless overridden
		-- version = "*",    -- Optional: pin to latest stable release
	},
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},

})

local function require_all_from(dir)
	local handle = vim.uv.fs_scandir(vim.fn.stdpath("config") .. "/lua/" .. dir)
	if not handle then return end

	while true do
		local name, type = vim.uv.fs_scandir_next(handle)
		if not name then break end

		if type == "file" and name:sub(-4) == ".lua" then
			local mod = dir .. "." .. name:sub(1, -5)
			require(mod)
		end
	end
end

require_all_from("config")
require "colors"
