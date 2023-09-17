return {
    {
        "windwp/nvim-autopairs", -- Close pairs automatically
        opts = {
            enable_check_bracket_line = false,
            ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
        },
        init = function()
            local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
            local autopairs = require("nvim-autopairs")
            local rule = require("nvim-autopairs.rule")
            autopairs.add_rules {
                rule(' ', ' ')
                    :with_pair(function(opts)
                        local pair = opts.line:sub(opts.col - 1, opts.col)
                        return vim.tbl_contains({
                            brackets[1][1] .. brackets[1][2],
                            brackets[2][1] .. brackets[2][2],
                            brackets[3][1] .. brackets[3][2],
                        }, pair)
                    end)
            }
            for _, bracket in pairs(brackets) do
                autopairs.add_rules {
                    rule(bracket[1] .. ' ', ' ' .. bracket[2])
                        :with_pair(function() return false end)
                        :with_move(function(opts)
                            return opts.prev_char:match('.%' .. bracket[2]) ~= nil
                        end)
                        :use_key(bracket[2])
                }
            end
        end
    },
    -- TODO: check for the existence of alternatives
    {
        "tpope/vim-surround", -- Manipulate brackets and other delimiters
    },
    {
        "tpope/vim-repeat", -- More advanced repeating with dot
    },
    {
        "gpanders/nvim-parinfer", -- Manages parenthesis while editing LISP-like files
        ft = { "yuck", "lisp" }
    },
    {
        "alvan/vim-closetag", -- Manipulate html tags
        ft = { "html", "xhtml", "phtml", "markdown", "php" },
        init = function()
            vim.cmd [[let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.md"]]
            vim.cmd [[let g:closetag_filetypes = "html,xhtml,phtml,markdown"]]
        end
    },
}
