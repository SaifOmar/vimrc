local authGenerics = {
	{
		method = "POST",
		path = "/auth/login",
		body = "{ \"email\": \"saif@gmail.com\", \"password\": \"123456\" }",
	},
	{
		method = "POST",
		path = "/auth/register",
		body =
		"{ \"name\": \"Saif\", \"email\": \"saif@gmail.com\", \"password\": \"123456\", \"password_confirmation\": \"123456\" }",
	},
}

local generics = {
	{
		method = "GET",
		path = "",
		body = "",
	},
	{
		method = "POST",
		path = "",
		body = "{}",
	},
}

local generateEndpoints = function(protocol, domain, port, path, method)
	local endpoint = method .. " " .. protocol .. "://" .. domain .. ":" .. port .. path .. " " .. "HTTP/1.1"
	return endpoint
end

local printTofile = function(endpoint, body, filePath)
	local file = io.open(filePath, "a")
	if not file then
		vim.notify("Failed to open file " .. filePath, vim.log.levels.ERROR)
		return
	end
	file:write(endpoint .. "\n")
	file:write("Content-Type: application/json" .. "\n\n")
	file:write(body .. "\n")
	file:write("###" .. "\n")
	file:close()
end

local seedGenericFiles = function(protocol, domain, port, path, current)
	if not protocol then protocol = "http" end
	if not port then port = "8000" end
	if not domain then domain = "127.0.0.1" end
	if not path then path = "" end

	local authFilePath = current .. "/rest/auth/auth.http"
	for _, v in pairs(authGenerics) do
		local endpoint = generateEndpoints(protocol, domain, port, path .. v.path, v.method)
		printTofile(endpoint, v.body, authFilePath)
	end

	local genericsFilePath = current .. "/rest/generics/generics.http"
	for _, v in pairs(generics) do
		local endpoint = generateEndpoints(protocol, domain, port, path .. v.path, v.method)
		printTofile(endpoint, v.body, genericsFilePath)
	end
end

-- need to make this better but I am lazy for now :)
local CreateRestFolder = function()
	local current = vim.fn.getcwd()
	print("Current directory: " .. current)

	if vim.fn.isdirectory(current .. "/rest") == 0 then
		vim.fn.mkdir(current .. "/rest", "p")
		vim.notify("Created directory: " .. current .. "/rest", vim.log.levels.INFO)
	end

	if vim.fn.isdirectory(current .. "/rest/auth") == 0 then
		vim.fn.mkdir(current .. "/rest/auth", "p")
		vim.notify("Created directory: " .. current .. "/rest/auth", vim.log.levels.INFO)
	end

	if vim.fn.isdirectory(current .. "/rest/generics") == 0 then
		vim.fn.mkdir(current .. "/rest/generics", "p")
		vim.notify("Created directory: " .. current .. "/rest/generics", vim.log.levels.INFO)
	end

	if vim.fn.filereadable(current .. "/rest/auth/auth.http") == 0 then
		local file = io.open(current .. "/rest/auth/auth.http", "w")
		if not file then
			vim.notify("Failed to create file " .. current .. "/rest/auth/auth.http", vim.log.levels.ERROR)
			return
		end
		file:close()
		vim.notify("File created at " .. current .. "/rest/auth/auth.http", vim.log.levels.INFO)
	end

	if vim.fn.filereadable(current .. "/rest/generics/generics.http") == 0 then
		local file = io.open(current .. "/rest/generics/generics.http", "w")
		if not file then
			vim.notify("Failed to create file " .. current .. "/rest/generics/generics.http",
				vim.log.levels.ERROR)
			return
		end
		file:close()
		vim.notify("File created at " .. current .. "/rest/generics/generics.http", vim.log.levels.INFO)
	end

	seedGenericFiles("http", "127.0.0.1", "8000", "", current)

	vim.notify("REST folder structure created successfully!", vim.log.levels.INFO)
end
vim.api.nvim_create_user_command("RestCreateGenerics", CreateRestFolder, {})
