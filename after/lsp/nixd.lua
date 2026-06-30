return {
    cmd = (function ()
        if vim.regex([[devenv.nix]]):match_str(vim.api.nvim_buf_get_name(0)) then
            return { "devenv", "lsp" }
        else
            return { "nixd" }
        end
    end)()
}
