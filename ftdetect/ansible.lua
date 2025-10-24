local function is_ansible(_, bufnr)
    local patterns = {
        ".*/playbooks/.*%.yml",
        ".*/playbooks/.*%.yaml",
        ".*/roles/.*/tasks/.*%.yml",
        ".*/roles/.*/tasks/.*%.yaml",
        ".*/roles/.*/handlers/.*%.yml",
        ".*/roles/.*/handlers/.*%.yaml",
    }
    local path = vim.api.nvim_buf_get_name(bufnr)
    for _, pattern in ipairs(patterns) do
        if string.find(path, pattern) then return "yaml.ansible" end
    end

    local content = vim.api.nvim_buf_get_lines(bufnr, 0, 7, false) or { "" }
    local matched_lines = 0
    for _, line in pairs(content) do
        if
            vim.regex([[^\(-\|\s\)\{2}name:]]):match_str(line) ~= nil
            or vim.regex([[^\(-\|\s\)\{2}hosts:]]):match_str(line) ~= nil
            or vim.regex([[^\(-\|\s\)\{2}become:]]):match_str(line) ~= nil
            or vim.regex([[^\(-\|\s\)\{2}become_user:]]):match_str(line) ~= nil
            or vim.regex([[^\(-\|\s\)\{2}tasks:]]):match_str(line) ~= nil
            or vim.regex([[^\(-\|\s\)\{2}collections:]]):match_str(line) ~= nil
            or vim.regex([[^\(-\|\s\)\{2}roles:]]):match_str(line) ~= nil
            or vim.regex([[^\(-\|\s\)\{2}vars:]]):match_str(line) ~= nil
            or vim.regex([[^\(-\|\s\)\{2}vars_files:]]):match_str(line) ~= nil
        then
            matched_lines = matched_lines + 1
        end
    end
    if matched_lines >= 3 then
        return "yaml.ansible"
    else
        return "yaml"
    end
end

vim.filetype.add({
    extension = {
        ansible = "yaml.ansible",
    },
    filename = {
        inventory = "confini",
    },
    pattern = {
        ["inventory_.*"] = "confini",
        [".*%.yml"] = is_ansible,
        [".*%.yaml"] = is_ansible,
    },
})
