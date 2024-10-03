local function is_ansible(_, bufnr)
    local content = vim.api.nvim_buf_get_lines(bufnr, 0, 7, false) or { "" }
    local matched_lines = 0
    for _, line in pairs(content) do
        if
            vim.regex([[^\(-\|\s\)\{2}name:]]):match_str(line) ~= nil or
            vim.regex([[^\(-\|\s\)\{2}hosts:]]):match_str(line) ~= nil or
            vim.regex([[^\(-\|\s\)\{2}become:]]):match_str(line) ~= nil or
            vim.regex([[^\(-\|\s\)\{2}become_user:]]):match_str(line) ~= nil or
            vim.regex([[^\(-\|\s\)\{2}tasks:]]):match_str(line) ~= nil or
            vim.regex([[^\(-\|\s\)\{2}collections:]]):match_str(line) ~= nil or
            vim.regex([[^\(-\|\s\)\{2}roles:]]):match_str(line) ~= nil or
            vim.regex([[^\(-\|\s\)\{2}vars:]]):match_str(line) ~= nil or
            vim.regex([[^\(-\|\s\)\{2}vars_files:]]):match_str(line) ~= nil
        then
            vim.notify("Matched line: " .. line)
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
    filename = {
        inventory = "confini"
    },
    pattern = {
        [".*%.yml"] = is_ansible,
        [".*%.yaml"] = is_ansible,
        [".*/playbooks/.*%.yml"] = "yaml.ansible",
        [".*/playbooks/.*%.yaml"] = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.yml"] = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.yaml"] = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.yml"] = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.yaml"] = "yaml.ansible",
        ["inventory_.*"] = "confini"
    }
})
