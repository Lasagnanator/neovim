local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
    return
end

local rule = require("nvim-autopairs.rule")

autopairs.setup({
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
})

local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
autopairs.add_rules {
  rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({
        brackets[1][1]..brackets[1][2],
        brackets[2][1]..brackets[2][2],
        brackets[3][1]..brackets[3][2],
      }, pair)
    end)
}
for _,bracket in pairs(brackets) do
  autopairs.add_rules {
    rule(bracket[1]..' ', ' '..bracket[2])
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%'..bracket[2]) ~= nil
      end)
      :use_key(bracket[2])
  }
end
