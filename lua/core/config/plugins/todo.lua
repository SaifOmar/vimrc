local M = {}

M.todo_path = vim.fn.expand("~/saif/todo.md")

-- Get the todo file path, create it if it doesn't exist
M.get_todo_file = function()
	-- Check if file exists
	local file_stat = vim.loop.fs_stat(M.todo_path)

	if not file_stat then
		-- File doesn't exist, create an empty one
		vim.fn.writefile({}, M.todo_path)
		vim.notify("Created new todo.txt file", vim.log.levels.INFO)
	else
		vim.notify("Found existing todo.txt file", vim.log.levels.INFO)
	end

	return M.todo_path
end

-- Load the file into a floating window
M.load_todo_to_window = function()
	local file_path = M.get_todo_file()
	local buf = vim.fn.bufadd(file_path)
	vim.fn.bufload(buf)

	local window = require("core.config.plugins.window")
	local todo_window = window.open_floating_win({
		buf = buf,
	})
	return todo_window
end

-- Command and keymap
vim.api.nvim_create_user_command("Todo", function()
	M.load_todo_to_window()
end, {})

vim.keymap.set("n", "<leader>td", ":Todo<CR>", { noremap = true, silent = true })

return M
