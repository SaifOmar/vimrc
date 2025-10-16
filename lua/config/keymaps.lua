-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("i", "<C-a>", "<ESC>ggVG")

-- open file explorer
vim.keymap.set("n", "<C-e>", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>sex", "<cmd>Sex!<CR>")

-- search latest sessions
-- vim.keymap.set("n", "<leader>rs", "<cmd>SessionSearch<CR>")

-- double escape to close
vim.keymap.set("n", "<ESC><ESC>", "<cmd>q!<CR>")
vim.keymap.set("i", "<ESC><ESC>", "<cmd>q!<CR>")

-- autocommenting with control "/"
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false, silent = true }) -- for <C-/>, use <C-_>
vim.api.nvim_set_keymap("v", "<C-/>", "gc", { noremap = false, silent = true }) -- for <C-/>, use <C-_>
vim.api.nvim_set_keymap("i", "<C-/>", "<ESC>gcci", { noremap = false, silent = true }) -- for <C-/>, use <C-_>

--

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- neo test custom keymaps
-- vim.keymap.set('n', '<leader>tn', function() require('neotest').run.run() end, { desc = "test the nearest test" })
-- vim.keymap.set('n', '<leader>ta', function() require('neotest').run.run(vim.fn.expand('%')) end,
-- { desc = "test the entire file" })

-- vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- keep that here for now make a file for venv select later
-- vim.keymap.set('n', '<leader>vv', ':VenvSelect<CR>',
-- 	{ noremap = true, silent = true, desc = 'Select virtual environment' })
--

-- Add some useful keyboard shortcuts
-- Dismiss all displayed messages
vim.keymap.set("n", "<leader>nd", "<cmd>:Noice dismiss<CR>", { desc = "Noice Dismiss" })
vim.keymap.set("n", "<leader>nhl", "<cmd>:Noice last<CR>", { desc = "Noice Last Message " })
vim.keymap.set("n", "<leader>ne", "<cmd>:Noice errors<CR>", { desc = "Noice Errors" })

-- vim.keymap.set("n", "<leader>dk", ShowDignostics)
--
