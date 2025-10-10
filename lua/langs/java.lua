if not Langs.java then
	return {}
end

Treesitter:update({ "java", "groovy" })
Mason:update("gradle-language-server")

---@type LazySpec
return {
	"nvim-java/nvim-java",
	version = "*",
    config = function ()
        require("java").setup()
    end
}
