local username = vim.uv.os_getenv("USER")
local hostname = vim.uv.os_gethostname()

return {
    cmd = (function()
        if vim.regex([[devenv.nix]]):match_str(vim.api.nvim_buf_get_name(0)) then
            return { "devenv", "lsp" }
        else
            return { "nixd" }
        end
    end)(),
    settings = {
        nixd = {
            nixpkgs = {
                expr = "import <nixpkgs> {}",
            },
            formatting = {
                cmd = { "alejandra" },
            },
            options = {
                nixos = {
                    expr = "(builtins.getFlake (toString ./.)).nixosConfigurations." .. hostname .. ".options",
                },
                home_manager = {
                    expr = '(builtins.getFlake (toString ./.)).homeConfigurations."' .. username .. '@' .. hostname .. '".options',
                },
            },
        },
    },
}
