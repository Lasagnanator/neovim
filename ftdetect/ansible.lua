local function is_ansible(_, bufnr)
    local content = vim.api.nvim_buf_get_lines(bufnr, 0, 10, false)[1] or ""
    if vim.regex([[- name:]]):match_str(content) ~= nil
    or vim.regex([[- hosts:]]):match_str(content) ~= nil
    or vim.regex([[- tasks:]]):match_str(content) ~= nil
    then
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
        [".*%.yaml"] = is_ansible
    }
})