-- PERF: delete candidate
local symbols = {
    merge_commit = '',
    commit = '',
    merge_commit_end = '',
    commit_end = '',

    -- Advanced symbols
    GVER = '',
    GHOR = '',
    GCLD = '',
    GCRD = '╭',
    GCLU = '',
    GCRU = '',
    GLRU = '',
    GLRD = '',
    GLUD = '',
    GRUD = '',
    GFORKU = '',
    GFORKD = '',
    GRUDCD = '',
    GRUDCU = '',
    GLUDCD = '',
    GLUDCU = '',
    GLRDCL = '',
    GLRDCR = '',
    GLRUCL = '',
    GLRUCR = '',
}

return {
    "isakbm/gitgraph.nvim",
    opts = {
        -- symbols = symbols,
        hooks = {
            -- Check diff of a commit
            on_select_commit = function(commit)
                vim.notify('DiffviewOpen ' .. commit.hash .. '^!')
                vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
            end,
            -- Check diff from commit a -> commit b
            on_select_range_commit = function(from, to)
                vim.notify('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
                vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
            end,
        },
    },
    keys = require("keybinds.plugins.gitgraph"):to_lazy(),
    dependencies = { 'sindrets/diffview.nvim' }
}
