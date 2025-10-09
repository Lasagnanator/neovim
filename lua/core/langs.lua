local ok = false
for lang, enabled in pairs(Langs) do
    if enabled then
        ok = pcall(require, "langs." .. lang)
    end
end
