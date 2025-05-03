local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup {
	filetypes = { 'javascript', 'javascriptreact', 'typescriptreact', 'typescript' }
}


lspconfig.emmet_language_server.setup({
	filetypes = { "javascriptreact", "html", "css", "sass", "scss", "less" },
})

if vim.fn.has("wsl") == 1 or vim.fn.has("unix") == 1 then
	lspconfig.phpactor.setup {
		root_dir = require('lspconfig').util.root_pattern(
			"composer.json",
			"package.json",
			".git",
			"*.php"
		),
		init_options = {
			["language_server_phpstan.enabled"] = false,
			["language_server_psalm.enabled"] = false,
			["language_server.catch_errors"] = false, -- Disable diagnostics on update
			["language_server.diagnostics_on_update"] = false, -- Disable diagnostics on update
			["language_server.diagnostics_on_open"] = false,
			["language_server.diagnostics_on_save"] = false, -- Disable diagnostics on save
			["language_server.diagnostic_providers"] = {},
			["code_transform.import_globals"] = true,
			["indexer.include_patterns"] = {
				"**/*.php",
				"**/*.phtml",
				"**/*.inc",
				"**/*.module",
				"**/*.install",
				"**/*.theme",
				"**/_ide_helper.php",
				"**/_ide_helper_models.php",
				"**/.phpstorm.meta.php"
			},
		},
	}
end

lspconfig.gopls.setup({
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})
-- Intelephense configuration with diagnostics enabled
lspconfig.intelephense.setup {
	root_dir = require('lspconfig').util.root_pattern(
		"composer.json",
		"package.json",
		".git",
		"*.php"
	),
	settings = {
		intelephense = {
			files = {
				maxSize = 50000000,
				associations = {
					"*.php", "*.phtml", "*.inc", "*.module", "*.install", "*.theme",
					"_ide_helper.php", "_ide_helper_models.php", ".phpstorm.meta.php"
				},
			},
			environment = {
				phpVersion = '8.1.0',
				includePaths = { './vendor' }
			},
			stubs = {
				"apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
				"dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext",
				"gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli",
				"oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite",
				"pgsql", "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML",
				"snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg",
				"sysvsem", "sysvshm", "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache",
				"zip", "zlib", "laravel"
			},
			completion = {
				insertUseDeclaration = true,
				fullyQualifyGlobalConstantsAndFunctions = false,
				maxItems = 100,
				resolveProvider = true
			},
			format = {
				enable = true
			},
			diagnostics = {
				enable = true,
				run = "onType"
			},
			telemetry = {
				enable = false
			}
		}
	}
}
