local function is_ansible(_, bufnr)
    local content = vim.api.nvim_buf_get_lines(bufnr, 0, 10, false) or { "" }
    local matched_lines = 0
    for _, line in pairs(content) do
        if
            vim.regex([[.*name:]]):match_str(line) ~= nil or
            vim.regex([[.*hosts:]]):match_str(line) ~= nil or
            vim.regex([[.*become:]]):match_str(line) ~= nil or
            vim.regex([[.*tasks:]]):match_str(line) ~= nil or
            vim.regex([[.*collections:]]):match_str(line) ~= nil or
            vim.regex([[.*vars_files:]]):match_str(line) ~= nil
        then
            matched_lines = matched_lines + 1
        end
    end
    if matched_lines >= 3 then
        return 'yaml.ansible'
    else
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
        [".*%.yaml"] = is_ansible,
        ["inventory_?.*"] = "confini"
    }
})
