local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup {
	filetypes = { 'vue', 'javascript', 'javascriptreact', 'typescriptreact', 'typescript' }
}


lspconfig.emmet_language_server.setup({
	filetypes = { "javascriptreact", "html", "css", "sass", "scss", "less" },
})


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
				maxSize = 5000000,
				associations = { "*.php", "*.phtml", "*.inc", "*.module", "*.install", "*.theme",
					"_ide_helper.php", "_ide_helper_models.php", ".phpstorm.meta.php"
				},
			},
			environment = {
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
			completionProvider = {
				resolveProvider = true
			},
			diagnostics = {
				enable = true
			},
			telemetry = {
				enable = false
			}
		}
	}
}
