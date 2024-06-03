return {
    "coffebar/transfer.nvim",
    config = true,
    cmd = { "TransferInit", "DiffRemote", "TransferUpload", "TransferDownload", "TransferDirDiff", "TransferRepeat" },
    keys = require("keybinds.plugins.transfer"):to_lazy()
}
