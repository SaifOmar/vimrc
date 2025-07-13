-- [[ Basic Keymaps ]]keke
--  See `:help vim.keymap.set()`
--  my custom keymaps (saif)
--
--I will try this for a bit and see how it feels
vim.keymap.set("i", "jj", "<ESC>")
-- control a to select all
vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("i", "<C-a>", "<ESC>ggVG")
--  control s to save
vim.keymap.set("n", "<C-s>", "<cmd>w!<CR>")
vim.keymap.set("i", "<C-s>", "<cmd>w!<CR><ESC>")

-- open file explorer
vim.keymap.set("n", "<C-e>", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>sex", "<cmd>Sex!<CR>")

-- search latest sessions
vim.keymap.set("n", "<leader>rs", "<cmd>SessionSearch<CR>")

-- double escape to close
vim.keymap.set("n", "<ESC><ESC>", "<cmd>q!<CR>")
vim.keymap.set("i", "<ESC><ESC>", "<cmd>q!<CR>")

-- autocommenting with control "/"
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false, silent = true })       -- for <C-/>, use <C-_>
vim.api.nvim_set_keymap("v", "<C-/>", "gc", { noremap = false, silent = true })        -- for <C-/>, use <C-_>
vim.api.nvim_set_keymap("i", "<C-/>", "<ESC>gcci", { noremap = false, silent = true }) -- for <C-/>, use <C-_>

-- Paste and clean carriage returns in normal mode
--control v to paste
vim.keymap.set("n", "<C-v>", "<ESC>p")
vim.keymap.set("i", "<C-v>", "<ESC>p")

--control z to undo
-- vim.keymap.set("n", "<c-z>", "u", { noremap = true })
-- vim.keymap.set("i", "<c-z>", "<esc>u", { noremap = true })
--

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })


-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Make movements operate on visual lines rather than logical lines
vim.keymap.set('n', 'j', 'gj', { noremap = true, desc = 'Move down by visual line' })
vim.keymap.set('n', 'k', 'gk', { noremap = true, desc = 'Move up by visual line' })

vim.keymap.set('n', '$', 'g$', { noremap = true, desc = 'Move to end of visual line' })
vim.keymap.set('n', '^', 'g^', { noremap = true, desc = 'Move to first non-blank of visual line' })
vim.keymap.set('n', '0', 'g0', { noremap = true, desc = 'Move to start of visual line' })
-- Arrow keys for visual line navigation
vim.keymap.set('n', '<Down>', 'gj', { noremap = true, desc = 'Move down by visual line' })
vim.keymap.set('n', '<Up>', 'gk', { noremap = true, desc = 'Move up by visual line' })
vim.keymap.set('n', '<Home>', 'g<Home>', { noremap = true, desc = 'Move to start of visual line' })
vim.keymap.set('n', '<End>', 'g<End>', { noremap = true, desc = 'Move to end of visual line' })
--

-- Add visual mode mappings
vim.keymap.set('v', 'j', 'gj', { noremap = true, desc = 'Move down by visual line' })
vim.keymap.set('v', 'k', 'gk', { noremap = true, desc = 'Move up by visual line' })
vim.keymap.set('v', '$', 'g$', { noremap = true, desc = 'Move to end of visual line' })
vim.keymap.set('v', '^', 'g^', { noremap = true, desc = 'Move to first non-blank of visual line' })
vim.keymap.set('v', '0', 'g0', { noremap = true, desc = 'Move to start of visual line' })

-- neo test custom keymaps
vim.keymap.set('n', '<leader>tn', function() require('neotest').run.run() end, { desc = "test the nearest test" })
vim.keymap.set('n', '<leader>ta', function() require('neotest').run.run(vim.fn.expand('%')) end,
	{ desc = "test the entire file" })
vim.keymap.set('n', '<leader>to', '<CMD>NvimTreeToggle<CR>', { noremap = true });


vim.api.nvim_set_keymap('n', '<Tab>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferPrevious<CR>', { noremap = true, silent = true })
-- keep that here for now make a file for venv select later
-- vim.keymap.set('n', '<leader>vv', ':VenvSelect<CR>',
-- 	{ noremap = true, silent = true, desc = 'Select virtual environment' })
--

-- Add some useful keyboard shortcuts
-- Dismiss all displayed messages
vim.keymap.set("n", "<leader>nd", "<cmd>:Noice dismiss<CR>", { desc = "Noice Dismiss" })
vim.keymap.set("n", "<leader>nhh", "<cmd>:Noice history<CR>", { desc = "Noice History" })
vim.keymap.set("n", "<leader>nhl", "<cmd>:Noice last<CR>", { desc = "Noice Last Message " })
vim.keymap.set("n", "<leader>ne", "<cmd>:Noice errors<CR>", { desc = "Noice Errors" })

vim.keymap.set('n', '<leader>dk', ShowDignostics)
--
-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
