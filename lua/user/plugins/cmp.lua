local kind_icons = {
    Text          = " ",
    Method        = "m ",
    Function      = " ",
    Constructor   = " ",
    Field         = " ",
    Variable      = " ",
    Class         = " ",
    Interface     = " ",
    Module        = " ",
    Property      = " ",
    Unit          = " ",
    Value         = " ",
    Enum          = " ",
    Keyword       = " ",
    Snippet       = " ",
    Color         = " ",
    File          = " ",
    Reference     = " ",
    Folder        = " ",
    EnumMember    = " ",
    Constant      = " ",
    Struct        = " ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
}

return {
    {
        "hrsh7th/nvim-cmp", -- Completion plugin
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = { -- Snippet engine call
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = { -- Borders
                    -- completion    = cmp.config.window.bordered("single"),
                    -- documentation = cmp.config.window.bordered("single"),
                },
                mapping = cmp.mapping.preset.insert({ -- Keybinds
                    ["<C-k>"]     = cmp.mapping.select_prev_item(),
                    ["<C-j>"]     = cmp.mapping.select_next_item(),
                    ["<C-b>"]     = cmp.mapping.scroll_docs(-2),
                    ["<C-f>"]     = cmp.mapping.scroll_docs(2),
                    ["<C-Space>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.abort()
                        else
                            cmp.complete()
                        end
                    end, { "i", "s" }),
                    ["<CR>"]      = cmp.mapping.confirm({ select = false }), -- False requires selection, true autoselects first result
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
                }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- Kind icons
                        vim_item.menu = ({                                             -- Menu items name
                            nvim_lsp                  = "[LSP]",
                            luasnip                   = "[Snip]",
                            buffer                    = "[Text]",
                            path                      = "[Path]",
                            nerdfont                  = "[NerdFont]",
                            emoji                     = "[Emoji]",
                            latex_symbols             = "[LaTeX]",
                            orgmode                   = "[ORG]",
                            omni                      = "[Omni]",
                            neorg                     = "[Neorg]",
                            ["vim-dadbod-completion"] = "[DB]"
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                sources = cmp.config.sources({ -- Sources for all files
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "omni" },
                }, {
                    { name = "buffer" },
                })
            })
            --<< PER-FILES CONFIGURATION

            --<< Configuration for tex files
            cmp.setup.filetype({ "tex", "plaintex" }, {
                sources = cmp.config.sources({
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                }, {
                    { name = "buffer" },
                    { name = "latex_symbols" },
                })
            })
            --<< Configuration for markdown files
            cmp.setup.filetype("markdown", {
                sources = cmp.config.sources({
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                }, {
                    { name = "buffer" },
                })
            })
            --<< Configuration for gitcommit files
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
                }, {
                    { name = "buffer" },
                })
            })
            --<< Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" }
                }
            })
            --<< Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
            cmp.setup.cmdline({ ":", "!" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" }
                }, {
                    { name = "cmdline" },
                    { name = "buffer" }
                })
            })
        end,
        dependencies = {
            {
                "L3MON4D3/LuaSnip", -- Snippet engine
                config = function()
                    local luasnip = require("luasnip.loaders.from_vscode")
                    luasnip.lazy_load()
                end,
                dependencies = {
                    "rafamadriz/friendly-snippets", -- Additional snippets
                },
            },
            "kyazdani42/nvim-web-devicons",
            -- "hrsh7th/cmp-nvim-lsp",       -- Completion integration with LSP
            "hrsh7th/cmp-buffer",         -- Completion for buffer
            "hrsh7th/cmp-path",           -- Completion for paths
            "hrsh7th/cmp-cmdline",        -- Completion for command line
            "hrsh7th/cmp-omni",           -- Completion with omnifunc plugins
            "kdheepak/cmp-latex-symbols", -- Completion for LaTeX symbols
            -- "chrisgrieser/cmp-nerdfont"   -- Completion for Nerd Fonts characters
            -- "hrsh7th/cmp-emoji"           -- Completion for emojis
            "petertriho/cmp-git",       -- Completion for git informations
            "saadparwaiz1/cmp_luasnip", -- Luasnip integration
        },
    },
}
