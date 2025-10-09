if not Langs.java then
	return {}
end

---@type LazySpec
return {
	"nvim-java/nvim-java",
	version = "*",
    config = function ()
        require("java").setup()
    end
}
