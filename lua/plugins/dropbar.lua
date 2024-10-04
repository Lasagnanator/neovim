return {
    {
        "Bekaboo/dropbar.nvim",
        lazy = false,
        opts = {
            menu = {
                keymaps = {
                    ["<Tab>"] = function()
                        local menu = require("dropbar.utils").menu.get_current()
                        if not menu then
                            return
                        end
                        local cursor = vim.api.nvim_win_get_cursor(menu.win)
                        local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
                        if component then
                            menu:click_on(component, nil, 1, 'l')
                        end
                    end,
                }
            }
        },
        keys = require("keybinds.plugins.dropbar"):to_lazy(),
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-fzf-native.nvim", -- optional, but required for fuzzy finder support
        }
    }
}
