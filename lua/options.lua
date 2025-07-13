-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.shortmess:append("sI")

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 251

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
-- See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 22
-- Enable line wrapping
vim.opt.wrap = true

-- disable highlighting for the line the cursor on
vim.opt.cursorline = false
-- Enable soft wrapping
vim.opt.linebreak = true
vim.opt.breakindent = true
-- vim.opt.showbreak = '↪ '

-- fuck swapfiles
vim.opt.swapfile = false
vim.opt.backup = false

vim.diagnostic.config({
	virtual_text = true, --Enable inline error messages
	signs = true,     -- Show signs in the gutter (left side)
	underline = true, -- Underline errors
	update_in_insert = true, -- Update diagnostics while in insert mode
	severity_sort = true,
	float = true
})

ShowDignostics = function()
	vim.diagnostic.open_float(nil, {
		focusable = false,
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	})
end
