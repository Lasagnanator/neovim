local M = {}


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
---@param element string
function M.Language_tools:update(element)
    self.tools = require("core.utils").update_list(self.tools, element)
end


--<< Keybind
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

---Creates new instance of a keymap
---@param mode string
---@param map string
---@param action string|function
---@param desc string
---@param opts table
---@return Keybind
function M.Keybind:new(mode, map, action, desc, opts)
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj.mode = mode
    obj.map = map
    obj.action = action
    obj.desc = desc
    obj.opts = opts
    return obj
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
