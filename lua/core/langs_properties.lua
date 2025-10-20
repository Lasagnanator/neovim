return {
	ansible = {
		dependencies = { "jinja", "yaml" },
		mason = { "ansible-language-server", "ansible-lint" },
	},
	docker = {
		mason = { "docker-compose-language-service", "dockerfile-language-server", "hadolint" },
		treesitter = { "dockerfile" },
	},
	go = {
		mason = { "gopls", "delve", "gofumpt", "gomodifytags", "goimports", "impl" },
		treesitter = { "go", "gomod", "gosum", "gotmpl", "gowork" },
	},
	java = {
		dependencies = { "xml" },
		mason = { "gradle-language-server" },
		treesitter = { "java", "groovy" },
	},
	jinja = {
		mason = { "jinja-lsp" },
		treesitter = { "jinja", "jinja_inline" },
	},
	json = {
		mason = { "json-lsp", "jsonlint" },
		treesitter = { "json", "jsonc" },
	},
	lua = {
		mason = { "lua-language-server", "stylua" },
		treesitter = { "lua" },
	},
	nvim = {
		dependencies = { "lua" },
	},
	python = {
		mason = { "debugpy", "basedpyright", "black" },
		treesitter = { "python" },
	},
	rust = {
		dependencies = { "toml" },
		mason = { "codelldb" },
		treesitter = { "rust" },
	},
	shell = {
		mason = { "bash-language-server", "shfmt", "shellcheck", "awk-language-server" },
		treesitter = { "bash", "awk" },
	},
	toml = {
		mason = { "taplo" },
		treesitter = { "toml" },
	},
	web = {
		dependencies = { "json" },
		mason = { "css-lsp", "html-lsp", "typescript-language-server", "eslint-lsp", "prettierd" },
		treesitter = { "html", "css", "javascript", "typescript" },
	},
	xml = {
		mason = { "lemminx", "xmlformatter" },
		treesitter = { "xml" },
	},
	yaml = {
		mason = { "yaml-language-server" },
		treesitter = { "yaml" },
	},
}
