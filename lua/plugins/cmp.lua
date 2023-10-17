return {
    {
        "hrsh7th/nvim-cmp", -- Completion plugin
        event = { "InsertEnter", "CmdLineEnter" },
        priority = Priority.completion,
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            cmp.setup({
                snippet = { -- Snippet engine call
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert(Keybinds.cmp()),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text"
                    }),
                },
                sources = cmp.config.sources({ -- Sources for all files
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "omni" },
                }, {
                    { name = "buffer" },
                })
            })

            --<< PER-FILES CONFIGURATION

            --<< Neorg
            cmp.setup.filetype("norg", {
                sources = cmp.config.sources({
                    { name = "neorg" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                })
            })
            --<< Tex
            cmp.setup.filetype({ "tex", "plaintex" }, {
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "latex_symbols" },
                })
            })
            --<< Markdown
            cmp.setup.filetype("markdown", {
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                })
            })
            --<< Gitcommit
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "cmp_git" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                })
            })
            --<< Use buffer source for `/` and `?`
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" }
                }
            })
            --<< Use cmdline & path source for ":"
            cmp.setup.cmdline({ ":", "!" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" }
                }, {
                    { name = "cmdline" },
                })
            })
        end,
        dependencies = {
            "onsails/lspkind.nvim",
            "nvim-tree/nvim-web-devicons",
            "hrsh7th/cmp-buffer",         -- Completion for buffer
            "hrsh7th/cmp-path",           -- Completion for paths
            "hrsh7th/cmp-cmdline",        -- Completion for command line
            "hrsh7th/cmp-omni",           -- Completion with omnifunc plugins
            "kdheepak/cmp-latex-symbols", -- Completion for LaTeX symbols
            "petertriho/cmp-git",       -- Completion for git informations
            {
                "L3MON4D3/LuaSnip", -- Snippet engine
                config = function()
                    local luasnip = require("luasnip.loaders.from_vscode")
                    luasnip.lazy_load()
                end,
                dependencies = {
                    "rafamadriz/friendly-snippets", -- Additional snippets
                    "saadparwaiz1/cmp_luasnip", -- Luasnip integration
                },
            },
        },
    },
}
