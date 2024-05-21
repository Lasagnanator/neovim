local cmp     = require("cmp")
local luasnip = require("luasnip")

return {
    ["<C-k>"]     = cmp.mapping.select_prev_item(),
    ["<C-j>"]     = cmp.mapping.select_next_item(),
    ["<C-b>"]     = cmp.mapping.scroll_docs(-2),
    ["<C-f>"]     = cmp.mapping.scroll_docs(2),
    ["<C-Space>"] = cmp.mapping.abort(),
    ["<CR>"]      = cmp.mapping.confirm({ select = false }),     -- False requires selection, true autoselects first result
    ["<Tab>"]     = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end, { "i", "s" }),
    ["<S-Tab>"]   = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { "i", "s" }),
}
