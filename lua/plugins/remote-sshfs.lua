-- PERF: delete candidate

---@diagnostic disable: different-requires
return {
    "nosduco/remote-sshfs.nvim",
    opts = {
        mounts = {
            base_dir = vim.fn.expand "$HOME" .. "/.nvim-sshfs/",
            unmount_on_exit = true,
        },
        handlers = {
            on_connect = {
                change_dir = true,
            },
            on_disconnect = {
                clean_mount_folders = true,
            },
        },
        ui = {
            confirm = {
                connect = false,
                change_dir = false,
            },
        },
    },
    cmd = {
        "RemoteSSHFSConnect",
        "RemoteSSHFSDisconnect",
        "RemoteSSHFSReload",
        "RemoteSSHFSEdit",
        "RemoteSSHFSLiveGrep",
        "RemoteSSHFSFindFiles",
    },
    keys = require("keybinds.plugins.remote-sshfs"):to_lazy(),
    dependencies = { "nvim-telescope/telescope.nvim" },
}
