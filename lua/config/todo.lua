local M = {}

-- Man I love lua
M.todo_path = vim.fn.expand("~") .. "/personal/todos/todo.md"
M.load_todos = function()
	if vim.fn.has("win32") == 1 then
		vim.notify("Why are you using windows you little sucker", vim.log.levels.ERROR)
		return
	end
	local dir = vim.fn.fnamemodify(M.todo_path, ":h")
	if vim.fn.isdirectory(dir) == 0 then
		local success, err = pcall(vim.fn.mkdir, dir, 'p')
		if not success then
			vim.notify("Failed to create directory " .. dir .. ": " .. err, vim.log.levels.ERROR)
			return
		end
		local file = io.open(M.todo_path, "w")
		if not file then
			vim.notify("Failed to create cheat sheet at " .. M.todo_path, vim.log.levels.ERROR)
			return
		end
		file:close()
		vim.notify("Cheat sheet created at " .. M.todo_path, vim.log.levels.INFO)
	end

	local buf = vim.fn.bufadd(M.todo_path)
	vim.api.nvim_set_current_buf(buf)

	return buf
end
vim.api.nvim_create_user_command("Todo", function()
	M.load_todos()
end, {})

vim.keymap.set("n", "<leader>td", ":Todo<CR>", { noremap = true, silent = true })

return M
