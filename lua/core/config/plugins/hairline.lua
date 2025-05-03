-- Heirline config to mimic bufferline.nvim setup
local heirline = require("heirline")

local BufferLine = {
	init = function(self)
		self.buffers = {}
		for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
			if vim.bo[bufnr].buflisted then
				table.insert(self.buffers, bufnr)
			end
		end
	end,
	static = {
		get_buf_name = function(bufnr)
			local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
			return name ~= "" and name or "[No Name]"
		end,
	},
	provider = function(self)
		local out = {}
		for _, bufnr in ipairs(self.buffers) do
			local name = self.get_buf_name(bufnr)
			local is_active = bufnr == vim.api.nvim_get_current_buf()
			local modified = vim.bo[bufnr].modified and " ●" or ""
			local hl = is_active and "%#TabLineSel#" or "%#TabLine#"
			table.insert(out, hl .. " " .. name .. modified .. " ")
		end
		return table.concat(out, "%#TabLineFill#|")
	end,
	hl = { bg = "NONE" },
}

heirline.setup({
	tabline = { BufferLine }
})
-- Keymaps (same as before)
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })
