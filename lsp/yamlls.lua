return require("schema-companion").setup_client(
	require("schema-companion").adapters.yamlls.setup({
		sources = {
			require("schema-companion").sources.matchers.kubernetes.setup({ version = "master" }),
			require("schema-companion").sources.lsp.setup(),
		},
	}),
	---@diagnostic disable-next-line: missing-fields
	{
		settings = {
			redhat = { telemetry = { enabled = false } },
			yaml = {
				schemaStore = {
					enable = true,
					url = "https://www.schemastore.org/api/json/catalog.json",
				},
			},
		},
	}
)
