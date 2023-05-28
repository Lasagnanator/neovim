--<< TREESITTER >>--

--<< Protected call
local nvim_treesitter_status, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not nvim_treesitter_status then
    return
end

--<< Settings
nvim_treesitter.setup {
    ensure_installed = { "lua", "python", "bash", "org" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" },
    },
    -- indent = {
    --     enable = true,
    -- },
}

--<< Extra
    --[[ autotag = {
        enable = true,
    } ]]
