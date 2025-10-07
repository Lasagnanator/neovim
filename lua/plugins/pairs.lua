---@type LazySpec
return {
    {
        "nvim-mini/mini.surround",
        version = "*",
        config = true
    },
    {
        "windwp/nvim-autopairs",
        branch = "master",
        opts = {
            enable_check_bracket_line = false,
        },
        config = function(_, opts)
            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")
            local cond = require("nvim-autopairs.conds")

            npairs.setup(opts)

            local function create_rule(a1, ins, a2, lang)
                npairs.add_rule(
                    Rule(ins, ins, lang)
                    :with_pair(function(options)
                        return a1 .. a2 ==
                            options.line:sub(options.col - #a1, options.col + #a2 - 1)
                    end)
                    :with_move(cond.none())
                    :with_cr(cond.none())
                    :with_del(function(options)
                        local col = vim.api.nvim_win_get_cursor(0)[2]
                        return a1 .. ins .. ins .. a2 ==
                            options.line:sub(col - #a1 - #ins + 1, col + #ins + #a2) -- insert only works for #ins == 1 anyway
                    end)
                )
            end

            create_rule('(', ' ', ')')
            create_rule('[', ' ', ']')
            create_rule('{', ' ', '}')

            create_rule('{', '%', '}')
            create_rule('{%', ' ', '%}')

            create_rule('(', '*', ')', 'ocaml')
            create_rule('(*', ' ', '*)', 'ocaml')
        end,
        event = { "InsertEnter", "CmdLineEnter" },
    },
}
