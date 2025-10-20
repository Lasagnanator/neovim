if not Langs.flutter then
	return {}
end

return {
	"nvim-flutter/flutter-tools.nvim",
	config = true,
	ft = "dart",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
