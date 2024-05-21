return {
    "akinsho/bufferline.nvim",
    opts = {
        options = {
            mode = "buffers",
            tab_size = 25,
            max_name_length = 25,
            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = false,
            ---@diagnostic disable-next-line: unused-local
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " "
                        or (e == "warning" and " " or "")
                    s = s .. n .. sym
                end
                return s
            end,
            name_formatter = function(buf)
                return " " .. buf.name
            end,
            custom_filter = function(buffer_number)
                local in_tab = false
                for _, buffer in pairs(vim.fn.tabpagebuflist()) do
                    if buffer == buffer_number then
                        in_tab = true
                    end
                end
                local ft = vim.bo[buffer_number].filetype
                if in_tab
                    and ft ~= "NvimTree"
                    and ft ~= "TelescopePrompt"
                    and ft ~= "DressingInput"
                    and ft ~= "Trouble"
                    and ft ~= "mason"
                    and ft ~= "packer"
                    and ft ~= "help"
                    and ft ~= "wiki"
                    and ft ~= "DiffviewFiles"
                    and ft ~= "qf"
                    and ft ~= "toggleterm"
                    and ft ~= "Alpha"
                    and ft ~= "dbui"
                    and ft ~= "dbout"
                then
                    return true
                end
            end,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "Explorer",
                    highlight = "TabLineSel",
                    text_align = "center",
                    -- separator = true,
                },
                {
                    filetype = "dbui",
                    text = "Dadbod UI",
                    highlight = "TabLineSel",
                    text_align = "center",
                    -- separator = true,
                },
            },
            show_buffer_icons = true,
            get_element_icon = function(buf) return require('nvim-web-devicons').get_icon(buf, { default = true }) end,
            show_buffer_close_icons = false,
            show_close_icon = false,
            separator_style = "slant",
            always_show_bufferline = true,
            enforce_regular_tabs = true,
            sort_by = "tabs",
        }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
