local M = {}


--<< Treesitter parsers

---@class Treesitter_parsers
---@field parsers string[]
M.Treesitter_parsers = {
    parsers = {}
}

---Create new instance of class *Treesitter_parsers*
---@param parsers? string[] List of tools to install
---@return Treesitter_parsers
function M.Treesitter_parsers:new(parsers)
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj.parsers = parsers or {}
    return obj
end

---Add a new parser to the list
---@param element string|string[]
function M.Treesitter_parsers:update(element)
    self.parsers = require("core.utils").update_list(self.parsers, element)
end

--<< List of tools that Mason needs to install

---@class Language_tools
---@field tools string[]
M.Language_tools = {
    tools = {},
}

---Create new instance of class *Language_tools*
---@param tools? string[] List of tools to install
---@return Language_tools
function M.Language_tools:new(tools)
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj.tools = tools or {}
    return obj
end

---Add a new tool to the list
---@param element string|string[]
function M.Language_tools:update(element)
    self.tools = require("core.utils").update_list(self.tools, element)
end

-- TODO: Check if binary is already installed
-- Check lua/mason-core/platform.lua for hints on getting os info
-- Get Package: require("mason-registry").get_package()
-- get info of host system: vim.loop.os_uname()
-- Path to bin field in Package table: var.spec.source.download.#.bin
-- Must always take the last part of the executable path

-- NOTE: example Package object
-- {
--   ['__event_handlers'] = {
--   },
--   ['__event_handlers_once'] = {
--   },
--   ['spec'] = {
--     ['bin'] = {
--       ['terraform-ls'] = '{{source.download.bin}}'
--     },
--     ['name'] = 'terraform-ls',
--     ['source'] = {
--       ['download'] = {
--         [1] = {
--           ['target'] = 'darwin_arm64',
--           ['files'] = {
--             ['terraform-ls.zip'] = 'https://releases.hashicorp.com/terraform-ls/{{ version | strip_prefix "v" }}/terraform-ls_{{ version | strip_prefix "v" }}_darwin_arm64.zip'
--           },
--           ['bin'] = 'terraform-ls'
--         },
--         [2] = {
--           ['target'] = 'darwin_x64',
--           ['files'] = {
--             ['terraform-ls.zip'] = 'https://releases.hashicorp.com/terraform-ls/{{ version | strip_prefix "v" }}/terraform-ls_{{ version | strip_prefix "v" }}_darwin_amd64.zip'
--           },
--           ['bin'] = 'terraform-ls'
--         },
--         [3] = {
--           ['target'] = 'linux_arm64',
--           ['files'] = {
--             ['terraform-ls.zip'] = 'https://releases.hashicorp.com/terraform-ls/{{ version | strip_prefix "v" }}/terraform-ls_{{ version | strip_prefix "v" }}_linux_arm64.zip'
--           },
--           ['bin'] = 'terraform-ls'
--         },
--         [4] = {
--           ['target'] = 'linux_arm',
--           ['files'] = {
--             ['terraform-ls.zip'] = 'https://releases.hashicorp.com/terraform-ls/{{ version | strip_prefix "v" }}/terraform-ls_{{ version | strip_prefix "v" }}_linux_arm.zip'
--           },
--           ['bin'] = 'terraform-ls'
--         },
--         [5] = {
--           ['target'] = 'linux_x64',
--           ['files'] = {
--             ['terraform-ls.zip'] = 'https://releases.hashicorp.com/terraform-ls/{{ version | strip_prefix "v" }}/terraform-ls_{{ version | strip_prefix "v" }}_linux_amd64.zip'
--           },
--           ['bin'] = 'terraform-ls'
--         },
--         [6] = {
--           ['target'] = 'linux_x86',
--           ['files'] = {
--             ['terraform-ls.zip'] = 'https://releases.hashicorp.com/terraform-ls/{{ version | strip_prefix "v" }}/terraform-ls_{{ version | strip_prefix "v" }}_linux_386.zip'
--           },
--           ['bin'] = 'terraform-ls'
--         },
--         [7] = {
--           ['target'] = 'win_x64',
--           ['files'] = {
--             ['terraform-ls.zip'] = 'https://releases.hashicorp.com/terraform-ls/{{ version | strip_prefix "v" }}/terraform-ls_{{ version | strip_prefix "v" }}_windows_amd64.zip'
--           },
--           ['bin'] = 'terraform-ls.exe'
--         },
--         [8] = {
--           ['target'] = 'win_x86',
--           ['files'] = {
--             ['terraform-ls.zip'] = 'https://releases.hashicorp.com/terraform-ls/{{ version | strip_prefix "v" }}/terraform-ls_{{ version | strip_prefix "v" }}_windows_386.zip'
--           },
--           ['bin'] = 'terraform-ls.exe'
--         },
--         [9] = {
--           ['target'] = 'win_arm64',
--           ['files'] = {
--             ['terraform-ls.zip'] = 'https://releases.hashicorp.com/terraform-ls/{{ version | strip_prefix "v" }}/terraform-ls_{{ version | strip_prefix "v" }}_windows_arm64.zip'
--           },
--           ['bin'] = 'terraform-ls.exe'
--         }
--       },
--       ['id'] = 'pkg:generic/hashicorp/terraform-ls@v0.33.2'
--     },
--     ['languages'] = {
--       [1] = 'Terraform'
--     },
--     ['desc'] = 'Terraform Language Server.',
--     ['categories'] = {
--       [1] = 'LSP'
--     },
--     ['homepage'] = 'https://github.com/hashicorp/terraform-ls',
--     ['licenses'] = {
--       [1] = 'MPL-2.0'
--     },
--     ['schema'] = 'registry+v1',
--     ['description'] = 'Terraform Language Server.',
--     ['schemas'] = {
--       ['lsp'] = 'vscode:https://raw.githubusercontent.com/hashicorp/vscode-terraform/master/package.json'
--     }
--   },
--   ['name'] = 'terraform-ls'
-- }

--<< Keybinds

---@class Keybind
---@field mode string The modes where to bind the key
---@field map string The key or the chord to bind
---@field action string|function The action to execute on press
---@field desc string The description of the key
---@field opts table Additional options to set
M.Keybind = {
    mode = "",
    map = "",
    action = "",
    desc = "",
    opts = {}
}

---Creates new instance of class *keymap*
---@param mode string|table
---@param map string
---@param action string|function
---@param desc string
---@param opts? table
---@return Keybind
function M.Keybind:new(mode, map, action, desc, opts)
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj.mode = mode
    obj.map = map
    obj.action = action
    obj.desc = desc
    obj.opts = opts or { silent = true, noremap = true }
    return obj
end

---Return the type of the object
function M.Keybind:type()
    return "Keybind"
end

---Set a keybind
function M.Keybind:set()
    local opts = self.opts
    opts.desc = self.desc
    vim.keymap.set(self.mode, self.map, self.action, opts)
end

---Set a keybind for the current buffer
function M.Keybind:bufset()
    local opts = self.opts
    opts.desc = self.desc
    opts.buffer = true
    vim.keymap.set(self.mode, self.map, self.action, opts)
end

---Return a table formatted for a lazy keybind
function M.Keybind:to_lazy()
    local lazy_keybind = { self.map, self.action, mode = self.mode, desc = self.desc }
    for opt, value in pairs(self.opts) do
        lazy_keybind[opt] = value
    end
    return lazy_keybind
end

---Return a table formatted as a normal keymap
function M.Keybind:to_list()
    local opts = self.opts
    opts.desc = self.desc
    return { self.mode, self.map, self.action, opts }
end

---@class Keybinds_group
---@field keybinds Keybind[]|Keybinds_group List of keybinds inside the group
M.Keybinds_group = {
    keybinds = {}
}

---Creates new instance of a *group of keybinds*
---@param keybinds Keybind[]|Keybinds_group[]
---@return Keybinds_group
function M.Keybinds_group:new(keybinds)
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj.keybinds = keybinds
    return obj
end

---Return the type of the object
function M.Keybinds_group:type()
    return "Binds_group"
end

---Set all the keys declared in the group
function M.Keybinds_group:set()
    for _, keybind in pairs(self.keybinds) do
        keybind:set()
    end
end

---Set all the keys declared in the group for the current buffer
function M.Keybinds_group:bufset()
    for _, keybind in pairs(self.keybinds) do
        keybind:bufset()
    end
end

---Return a list of tables formatted for a lazy keybind
function M.Keybinds_group:to_lazy()
    local lazy_keybinds = {}
    for _, keybind in pairs(self.keybinds) do
        table.insert(lazy_keybinds, keybind:to_lazy())
    end
    return lazy_keybinds
end

function M.Keybinds_group:to_list()
    local list_keybinds = {}
    for _, keybind in pairs(self.keybinds) do
        table.insert(list_keybinds, keybind:to_list())
    end
    return list_keybinds
end


return M
