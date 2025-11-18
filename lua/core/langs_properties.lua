return {
    ansible = {
        dependencies = { "jinja", "yaml" },
        mason = { "ansible-language-server", "ansible-lint" },
    },
    csharp = {
        mason = { "roslyn", "netcoredbg" },
        treesitter = { "c_sharp" },
    },
    docker = {
        mason = { "docker-compose-language-service", "dockerfile-language-server", "hadolint" },
        treesitter = { "dockerfile" },
    },
    flutter = {
        treesitter = { "dart" },
    },
    go = {
        mason = { "gopls", "delve", "gofumpt", "gomodifytags", "goimports", "impl" },
        treesitter = { "go", "gomod", "gosum", "gotmpl", "gowork" },
    },
    htmx = {
        mason = { "htmx-lsp" }
    },
    java = {
        dependencies = { "xml" },
        mason = {
            "jdtls",
            "java-debug-adapter",
            "java-test",
            "vscode-spring-boot-tools",
            "gradle-language-server",
        },
        treesitter = { "java", "groovy" },
    },
    jinja = {
        mason = { "jinja-lsp" },
        treesitter = { "jinja", "jinja_inline" },
    },
    json = {
        mason = { "json-lsp", "jsonlint" },
        treesitter = { "json", "jsonc" },
    },
    lua = {
        mason = { "lua-language-server", "stylua" },
        treesitter = { "lua" },
    },
    markdown = {
        mason = { "marksman" },
        treesitter = { "markdown", "markdown_inline" },
    },
    nginx = {
        mason = { "nginx-language-server" },
        treesitter = { "nginx" }
    },
    nvim = {
        dependencies = { "lua" },
    },
    ocaml = {
        mason = { "ocamlearlybird" },
        treesitter = { "ocaml", "ocaml_interface" },
    },
    php = {
        mason = { "phpactor" },
        treesitter = { "php", "phpdoc" },
    },
    python = {
        mason = { "debugpy", "basedpyright", "black" },
        treesitter = { "python" },
    },
    rust = {
        dependencies = { "toml" },
        mason = { "codelldb" },
        treesitter = { "rust" },
    },
    shell = {
        mason = { "bash-language-server", "shfmt", "shellcheck", "awk-language-server" },
        treesitter = { "bash", "awk" },
    },
    svelte = {
        mason = { "svelte-language-server" },
        treesitter = { "svelte" },
    },
    tailwind = {
        mason = { "tailwindcss-language-server" },
    },
    toml = {
        mason = { "taplo" },
        treesitter = { "toml" },
    },
    web = {
        dependencies = { "json" },
        mason = { "css-lsp", "html-lsp", "typescript-language-server", "eslint-lsp", "prettierd" },
        treesitter = { "html", "css", "javascript", "typescript" },
    },
    xml = {
        mason = { "lemminx", "xmlformatter" },
        treesitter = { "xml" },
    },
    yaml = {
        mason = { "yaml-language-server" },
        treesitter = { "yaml" },
    },
    zig = {
        mason = { "zls", "codelldb" },
        treesitter = { "zig" },
    },
}
