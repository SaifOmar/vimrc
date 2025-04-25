vim.treesitter.language.register('php', 'blade') -- the someft filetype will use the
-- vim.treesitter.language.register('blade', 'javascript') -- the someft filetype will use the python parser and queries.
-- autocommenting

vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})
require 'nvim-treesitter.configs'.setup { ... }


local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = { "src/parser.c" },
		branch = "main",
	},
	filetype = "blade",
};
