if not Langs.orgmode then
	return {}
end

---@type LazySpec
return {
	{
		"nvim-orgmode/orgmode",
		version = "*",
		opts = {
			org_agenda_files = os.getenv("HOME") .. "/org/**/*",
			org_default_notes_file = os.getenv("HOME") .. "/orgfiles/refile.org",
		},
		event = "VeryLazy",
		ft = "org",
	},
	{
		"chipsenkbeil/org-roam.nvim",
        branch = "main",
		opts = {
			directory = os.getenv("HOME") .. "/org",
		},
		dependencies = {
			"nvim-orgmode/orgmode",
		},
		event = "VeryLazy",
	},
}
