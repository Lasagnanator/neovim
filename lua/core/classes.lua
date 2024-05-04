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
    local lazy_keybind = { self.map, self.action, mode = self.mode }
    for opt, value in pairs(self.opts) do
        lazy_keybind[opt] = value
    end
    return lazy_keybind
end

---Return a table formatted as a normal keymap
function M.Keybind:to_list()
    return { self.mode, self.map, self.action, self.opts}
end


-- NOTE: not sure if the group of keybinds is gonna be useful, but whatever

---@class Keybinds_group
---@field group_key string The key to access the group after leader
---@field group_desc string The description of the group
---@field keybinds Keybind[]|Keybinds_group List of keybinds inside the group
M.Keybinds_group = {
    group_key = "",
    group_desc = "",
    keybinds = {}
}

---Creates new instance of a *group of keybinds*
---@param group_key string
---@param group_desc string
---@param keybinds Keybind[]|Keybinds_group[]
---@return Keybinds_group
function M.Keybinds_group:new(group_key, group_desc, keybinds)
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj.group_key = group_key
    obj.group_desc = group_desc
    obj.keybinds = keybinds
    return obj
end

---Return the type of the object
function M.Keybinds_group:type()
    return "Binds_group"
end

---Set a group description and all the keys declared with it
function M.Keybinds_group:set()
    local ok, wk = pcall(require, "which-key")
    if not ok then
        print("Problem with which key, aborting.")
        return
    end
    wk.register({ [self.group_key] = { name = self.group_desc } })
    for _, keybind in pairs(self.keybinds) do
        keybind:set()
    end
end


---@deprecated
M.Lsp = {

    servers = {},

    new = function(self, obj, servers)
        obj = obj or {}
        setmetatable(obj, self)
        self.__index = self
        obj.servers = servers or {}
        return obj
    end,

    add = function(self, name, opts)
        self.servers[name] = opts
    end,

    configure = function(self)
        local ok, lspconfig = pcall(require, "lspconfig")
        if not ok then
            print("LSPConfig could not be loaded, aborting setup.")
            return
        end
        for lsp, config in pairs(self.servers) do
            lspconfig[lsp].setup(config)
        end
    end,
}

return M
