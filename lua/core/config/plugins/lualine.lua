local recent_keys = {}

-- Function to keep recent keys (max 5)
local function track_keypresses(check)
	if not check then return end
	vim.on_key(function(char)
		local mode = vim.api.nvim_get_mode().mode
		if mode:sub(1, 1) == "i" then
			return -- Skip insert mode (and variations like i, ic, ix)
		end
		-- Ignore certain control keys if needed
		if #char > 0 then
			table.insert(recent_keys, 1, vim.fn.keytrans(char))
			if #recent_keys > 5 then
				table.remove(recent_keys)
			end
		end
	end, vim.api.nvim_create_namespace("keypress_tracker"))
end
track_keypresses(false)

require('lualine').setup {
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "tokyodark",
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_x = {
			-- show coplilot status
			{ 'fileformat' },
			{
				function()
					local ok, status = pcall(vim.fn["copilot#Enabled"])
					if ok and status == 1 then
						return " "
					end
					return ""
				end,
			},
			{
				function()
					local msg = 'No Active LSP'
					local clients = vim.lsp.get_clients()
					if next(clients) == nil then
						return msg
					end
					local client_names = {}
					for _, client in ipairs(clients) do
						-- exclude tailwind css and github copliot
						if client.name ~= 'tailwindcss' and client.name ~= 'GitHub Copilot' then
							-- table.insert(client_names, client.name)
							-- table.insert(client_names, client.name:sub(1, 3))
							table.insert(client_names, client.name:sub(1, 1))
						end
					end
					return table.concat(client_names, ',')
				end,
				icon = '',
				color = { fg = '#51afef' },
			},

		},
		lualine_b = {
			{
				'branch',
				icon = '',
			},
			{
				'diff',
				diff_color = {
					added = { fg = '#A3BE8C' },
					modified = { fg = '#D08770' },
					removed = { fg = '#BF616A' },
				},
				symbols = {
					added = ' ',
					modified = '柳',
					removed = ' ',

					-- added = '+',
					-- modified = '~',
					-- removed = '-',
				},
			},
		},
		lualine_c = {
			{
				'filename',

				path = 1,
				file_status = true,
				symbols = {
					modified = '●', -- Text to show when the file is modified.
					readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
				}
			},
			{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				symbols = {
					modified = '● ',
					error = ' ',
					warn = ' ',
					info = ' ',
				},
			},
			{
				function()
					return require('noice').api.status.search.get()
				end,
				cond = function()
					return package.loaded['noice'] and require('noice').api.status.search.has()
				end,
				color = { fg = '#ff9e64' },
			},
			{
				function()
					return "     " .. table.concat(recent_keys, " ")
				end,
				color = { fg = '#ff9e64' },
			},
		},
		-- show time to the far right side of the screen
		-- y and x will be ther right but will go instead of something (I think)
		lualine_z = {
			'location',
			{ function() return os.date('%H:%M') end },
		},
	},
}
