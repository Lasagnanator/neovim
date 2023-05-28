--<< ORGMODE >>--

--<< Protected call
local ok, orgmode = pcall(require, "orgmode")
if not ok then
    return
end

--<< Setup
orgmode.setup({
    org_agenda_files = { "~/.orgmode/*" },
    org_default_notes_file = "~/.orgmode/default-notes.org",
})

orgmode.setup_ts_grammar()
