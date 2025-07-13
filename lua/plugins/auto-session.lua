return {
	'rmagatti/auto-session',
	lazy = false,
	event = "VimEnter",
	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
		-- log_level = 'debug',
		git_use_branch_name = true,
		git_auto_restore_on_branch_change = true,
		auto_restore = false,
	},
}
