--<< LAZY & PLUGINS >>--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

    --<< Highlighting
    "nvim-treesitter/nvim-treesitter",     -- Syntax highlighting
    {
        "nvim-treesitter/playground",      -- Treesitter informations in Neovim
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    "nvim-treesitter/nvim-treesitter-context",     -- Shows which function are you editing on the first line of the screen
    "folke/lsp-colors.nvim",                       -- Fills in the colors missing from TS servers

    --<< LSP and diagnostics
    "neovim/nvim-lspconfig",                     -- Defaults for LSP
    "williamboman/mason.nvim",                   -- Automate installation of LSP servers
    {
        "williamboman/mason-lspconfig.nvim",     -- Bridges the two plugins
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",     -- Enable linters and formatters to use the LSP client
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "jay-babu/mason-null-ls.nvim",     -- Bridge the gap between Mason and null-ls
        dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
    },
    "ray-x/lsp_signature.nvim",
    {
        "folke/trouble.nvim",   -- List of diagnostics
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },

    --<< Extra languages
    "isobit/vim-caddyfile",                    -- Caddyfile syntax highlighting
    "fladson/vim-kitty",                       -- Kitty.conf file syntax highlighting
    "elkowar/yuck.vim",                        -- .yuck file syntax highlighting
    "theRealCarneiro/hyprland-vim-syntax",     -- Hyprland configuration syntax highlighting
    "khaveesh/vim-fish-syntax",                -- Fish LSP

    --<< Navigation
    {
        "nvim-tree/nvim-tree.lua",   -- File navigation
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    {
        "nvim-telescope/telescope.nvim",   -- File finder with filters
        dependencies = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",   -- fzf integration for Telescope
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    "nvim-telescope/telescope-file-browser.nvim",     -- File browser extension for Telescope
    "nvim-telescope/telescope-ui-select.nvim",        -- Use Telescope

    --<< Completion
    {
        "hrsh7th/nvim-cmp",   -- Completion plugin
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    "hrsh7th/cmp-nvim-lsp",           -- Completion integration with LSP
    "hrsh7th/cmp-buffer",             -- Completion for buffer
    "hrsh7th/cmp-path",               -- Completion for paths
    "hrsh7th/cmp-cmdline",            -- Completion for command line
    "hrsh7th/cmp-omni",               -- Completion with omnifunc plugins
    "kdheepak/cmp-latex-symbols",     -- Completion for LaTeX symbols
    -- "chrisgrieser/cmp-nerdfont" -- Completion for Nerd Fonts characters
    -- "hrsh7th/cmp-emoji" -- Completion for emojis
    "petertriho/cmp-git",           -- Completion for git informations
    "saadparwaiz1/cmp_luasnip",     -- Luasnip integration

    --<< Snippets
    "L3MON4D3/LuaSnip",                 -- Snippet engine
    "rafamadriz/friendly-snippets",     -- Additional snippets

    --<< Database
    "tpope/vim-dadbod",                   -- Database engine
    {
        "kristijanhusak/vim-dadbod-ui",   -- UI for interacting with databases
        dependencies = { "tpope/vim-dadbod" },
    },
    {
        "kristijanhusak/vim-dadbod-completion",   -- Completion (needed outside of LSP?)
        dependencies = { "tpope/vim-dadbod", "hrsh7th/nvim-cmp" },
    },

    --<< Utilities
    "akinsho/toggleterm.nvim",             -- Neovim's terminal wrapper
    {
        "Shatur/neovim-session-manager",   -- Automatic session manager
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "stevearc/dressing.nvim",          -- Interface for input prompts
    "numToStr/Comment.nvim",           -- Easier commenting
    "lambdalisue/suda.vim",            -- Edit with su permission maintaining personal configuration
    "norcalli/nvim-colorizer.lua",     -- Colorful hex codes
    "b0o/schemastore.nvim",            -- JSON schemas downloader for JSON LSP
    {
        "nvim-orgmode/orgmode",        -- Organizer, TODOs and calendar
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    --<< LaTeX and markdown
    { "ellisonleao/glow.nvim",     -- Preview markdown files in editor
        -- ft = { "markdown" },
    },
    {
        "iamcco/markdown-preview.nvim",   -- Preview markdown files in browser
        build = "app/install.sh",
        ft = { "markdown" },
    },
    "lervag/vimtex",

    --<< Git
    "tpope/vim-fugitive",           -- Git tools inside neovim
    "lewis6991/gitsigns.nvim",      -- Git decorations
    {
        "sindrets/diffview.nvim",   -- Viewer for diffs and merge resolution
        dependencies = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" }
    },
    --TODO: check which git plugins are really needed

    --<< Pairs and brackets
    -- "jiangmiao/auto-pairs" -- Generate final bracket automatically
    "windwp/nvim-autopairs",      -- Close pairs automatically
    "tpope/vim-surround",         -- Manipulate brackets and other delimiters
    "tpope/vim-repeat",           -- More advanced repeating with dot
    "gpanders/nvim-parinfer",     -- Manages parenthesis while editing LISP-like files
    {
        "alvan/vim-closetag",     -- Manipulate html tags
        ft = { "html", "xhtml", "phtml", "markdown", "php" }
    },

    --<< Theming and customizing
    {
        "glepnir/dashboard-nvim",   -- Customize the opening screen
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    {
        "nvim-lualine/lualine.nvim",   -- Custom statusline written in Lua
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    {
        "akinsho/bufferline.nvim",   -- Custom bufferline/tagline written in lua
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    "folke/tokyonight.nvim",         -- Tokyonight Neovim theme
    "Mofiqul/dracula.nvim",          -- Dracula Neovim theme
    "lunarvim/synthwave84.nvim",     -- Synthwave '84 Neovim theme
}

local opts = {}

local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end

lazy.setup(plugins, opts)
