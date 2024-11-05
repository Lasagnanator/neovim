return {
    ansible = {
        enabled = false,
        dependencies = { "jinja", "yaml" },
    },
    caddy = {
        enabled = false,
    },
    clang = {
        enabled = false,
    },
    django = {
        enabled = false,
        dependencies = { "jinja", "python" }
    },
    docker = {
        enabled = false,
    },
    elixir = {
        enabled = false,
    },
    fish = {
        enabled = false,
    },
    flutter = {
        enabled = false,
    },
    go = {
        enabled = false,
    },
    hurl = {
        enabled = false,
    },
    hyprland = {
        enabled = false,
    },
    json = {
        enabled = false,
    },
    java = {
        enabled = false,
        -- TODO: uncomment and copy to Scala after adding language
        -- dependencies = { "xml" }
    },
    jinja = {
        enabled = false,
    },
    jupyter = {
        enabled = false,
        dependencies = { "python" }
    },
    kitty = {
        enabled = false,
    },
    lua = {
        enabled = false,
    },
    markdown = {
        enabled = false,
    },
    neorg = {
        enabled = false,
    },
    nginx = {
        enabled = false,
    },
    nix = {
        enabled = false,
    },
    nu = {
        enabled = false,
    },
    nvim = {
        enabled = false,
        dependencies = { "lua" }
    },
    obsidian = {
        enabled = false,
        dependencies = { "markdown" }
    },
    orgmode = {
        enabled = false,
    },
    perl = {
        enabled = false,
    },
    php = {
        enabled = false,
    },
    powershell = {
        enabled = false,
    },
    puppet = {
        enabled = false,
        dependencies = { "ruby" }
    },
    python = {
        enabled = false,
    },
    ruby = {
        enabled = false,
    },
    rust = {
        enabled = false,
        dependencies = { "toml" }
    },
    scala = {
        enabled = false,
    },
    shell = {
        enabled = false,
    },
    sql = {
        enabled = false,
    },
    svelte = {
        enabled = false,
        dependencies = { "json", "web" }
    },
    terraform = {
        enabled = false,
    },
    tex = {
        enabled = false,
    },
    toml = {
        enabled = false,
    },
    vue = {
        enabled = false,
        dependencies = { "json", "web" }
    },
    web = {
        enabled = false,
        dependencies = { "json" }
    },
    yaml = {
        enabled = false,
    },
    yuck = {
        enabled = false,
    },
    zig = {
        enabled = false,
    }
}
