local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

M = {}

M.global = keys:new({
    key:new('n', '<Leader>og', '<Cmd>GrugFar<CR>', "Open GrugFar", silent),
})

M.keymaps = {
    replace = { n = '<localleader>mr' },
    qflist = { n = '<localleader>mq' },
    syncLocations = { n = '<localleader>ms' },
    syncLine = { n = '<localleader>ml' },
    close = { n = '<localleader>mc' },
    historyOpen = { n = '<localleader>mt' },
    historyAdd = { n = '<localleader>ma' },
    refresh = { n = '<localleader>mf' },
    openLocation = { n = '<localleader>mo' },
    openNextLocation = { n = '<down>' },
    openPrevLocation = { n = '<up>' },
    gotoLocation = { n = '<enter>' },
    pickHistoryEntry = { n = '<enter>' },
    abort = { n = '<localleader>mb' },
    help = { n = 'g?' },
    toggleShowCommand = { n = '<localleader>mw' },
    swapEngine = { n = '<localleader>me' },
    previewLocation = { n = '<localleader>mi' },
    swapReplacementInterpreter = { n = '<localleader>mx' },
    applyNext = { n = '<localleader>mj' },
    applyPrev = { n = '<localleader>mk' },
    syncNext = { n = '<localleader>mn' },
    syncPrev = { n = '<localleader>mp' },
    syncFile = { n = '<localleader>mv' },
    nextInput = { n = '<tab>' },
    prevInput = { n = '<s-tab>' },
}

return M
