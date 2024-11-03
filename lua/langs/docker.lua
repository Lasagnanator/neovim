if not Langs.docker then return {} end

local utils = require("core.utils")

Treesitter:update("dockerfile")
Mason:update({ "docker-compose-language-service", "dockerfile-language-server", "hadolint" })
After:add(function()
    require("lspconfig").dockerls.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
        single_file_support = true
    })

    require("lspconfig").docker_compose_language_service.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
        single_file_support = true
    })

    require("lint").linters_by_ft.dockerfile = { "hadolint" }
end)

return {}
