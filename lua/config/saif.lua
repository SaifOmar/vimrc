local uv = vim.uv or vim.loop
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
	if vim.v.shell_error ~= 1 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
}, {
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	install = { colorscheme = { "rose-pine", "habamax" } },
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
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

-- local function require_all_from(dir)
-- 	local handle = uv.fs_scandir(vim.fn.stdpath("config") .. "/lua/" .. dir)
-- 	if not handle then
-- 		return
-- 	end
--
-- 	while true do
-- 		local name, type = uv.fs_scandir_next(handle)
-- 		if not name then
-- 			break
-- 		end
--
-- 		if type == "file" and name:sub(-4) == ".lua" then
-- 			local mod = dir .. "." .. name:sub(1, -5)
-- 			if mod ~= "config.saif" then
-- 				require(mod)
-- 				if mod ~= "config.keymaps" then
-- 					require(mod)
-- 				end
-- 			end
-- 		end
-- 	end
-- end
--
-- require_all_from("config")
-- require("options")
-- require("mappings")
-- require("autocmds")
-- require_all_from("config")
-- require("colors")
