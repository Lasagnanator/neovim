local function is_ansible(_, bufnr)
    local content = vim.api.nvim_buf_get_lines(bufnr, 0, 2, false) or { "" }
    local ansible = false
    for _, line in pairs(content) do
        if
            vim.regex([[.*- name:]]):match_str(line) ~= nil or
            vim.regex([[.*hosts:]]):match_str(line) ~= nil or
            vim.regex([[.*become:]]):match_str(line) ~= nil or
            vim.regex([[.*tasks:]]):match_str(line) ~= nil or
            vim.regex([[.*vars_files:]]):match_str(line) ~= nil
        then
            ansible = true
            return 'yaml.ansible'
        end
    end
    if not ansible then
        return 'yaml'
    end
end

vim.filetype.add({
    extension = {
        ansible = "yaml.ansible"
    },
    pattern = {
        [".*/playbooks/.*%.yml"] = "yaml.ansible",
        [".*/playbooks/.*%.yaml"] = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.yml"] = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.yaml"] = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.yml"] = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.yaml"] = "yaml.ansible",
        [".*%.yml"] = is_ansible,
        [".*%.yaml"] = is_ansible
    }
})
