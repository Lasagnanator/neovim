---@type LazySpec
return {
	{
		"nvim-mini/mini.surround",
		version = "*",
		config = true,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"windwp/nvim-autopairs",
		branch = "master",
		opts = {
			enable_check_bracket_line = false,
		},
		config = function(_, opts)
			local autopairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")

			-- Base setup
			autopairs.setup(opts)

			---Create a custom rule for inserting specific symbols between brackets
			---@param bra string Left symbol
			---@param ins string Symbol to insert
			---@param ket string Right symbol
			---@param lang? string Language for conditional activation of rule
			local function create_rule(bra, ins, ket, lang)
				autopairs.add_rule(Rule(ins, ins, lang):with_pair(function(pos)
					return bra .. ket == pos.line:sub(pos.col - #bra, pos.col + #ket - 1)
				end):with_del(function(pos)
					local col = vim.api.nvim_win_get_cursor(0)[2]
					return bra .. ins .. ins .. ket == pos.line:sub(col - #bra - #ins + 1, col + #ins + #ket)
				end))
			end

			-- Space between brackets
			create_rule("(", " ", ")")
			create_rule("[", " ", "]")
			create_rule("{", " ", "}")

			-- Jinja brackets
			create_rule("{", "%", "}")
			create_rule("{%", " ", "%}")
			create_rule("{", "#", "}")
			create_rule("{#", " ", "#}")

			-- Ocaml
			create_rule("(", "*", ")", "ocaml")
			create_rule("(*", " ", "*)", "ocaml")
		end,
		event = { "InsertEnter", "CmdLineEnter" },
	},
}
