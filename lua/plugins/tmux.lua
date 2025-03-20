return {

    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
    },
    keys = {
        { "<A-h>",  "<Cmd>TmuxNavigateLeft<CR>" },
        { "<A-j>",  "<Cmd>TmuxNavigateDown<CR>" },
        { "<A-k>",  "<Cmd>TmuxNavigateUp<CR>" },
        { "<A-l>",  "<Cmd>TmuxNavigateRight<CR>" },
        { "<A-\\>", "<Cmd>TmuxNavigatePrevious<CR>" },
    },

}
