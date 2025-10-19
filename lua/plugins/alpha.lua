return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dashboard = require("dashboards." .. Dashboard)
		local ver = vim.version()
		local alpha = require("alpha")

		local padding = {
			type = "padding",
			val = 2,
		}

		local header = {
			type = "text",
			val = dashboard.ascii,
			opts = {
				position = "center",
				hl = "Function",
			},
		}

		local info = {
			type = "group",
			val = {
				{
					type = "text",
					val = dashboard.version_text .. " " .. ver.major .. "." .. ver.minor .. "." .. ver.patch,
				},
				{
					type = "text",
					val = "",
				},
				{
					type = "text",
					val = "",
				},
			},
			opts = {
				inherit = {
					position = "center",
					hl = "statement",
				},
			},
		}

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local time = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				alpha.default_config.layout[4].val[2].val = stats.loaded .. " " .. dashboard.mods_text .. " " .. stats.count
				alpha.default_config.layout[4].val[3].val = dashboard.time_text .. " " .. time .. " ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		local function button(icon, label, shortcut, command)
			return {
				type = "button",
				val = icon .. "   " .. label,
				on_press = function()
					vim.cmd(command)
				end,
				opts = {
					shortcut = string.upper(shortcut),
					keymap = {
						"n",
						shortcut,
						"<Cmd>" .. command .. "<CR>",
						{ noremap = true, silent = true, nowait = true },
					},
					position = "center",
					align_shortcut = "right",
					hl_shortcut = "Title",
					width = 25,
					shrink_margin = true,
				},
			}
		end

		local buttons = {
			type = "group",
			val = (function()
				local options = {
					button("", "Files", "f", "FzfLua files"),
					button("󰏇", "Explorer", "e", "Oil"),
					button("", "Word", "w", "FzfLua live_grep"),
					button("󰅙", "Quit", "q", "q!"),
				}
				if Langs.neorg then
					table.insert(options, 3, button("󰴓", "Notes", "n", "Neorg index"))
					table.insert(options, 4, button("󰠮", "Logbook", "l", "Neorg journal toc open"))
				end
				return options
			end)(),
		}

		local footer = {
			type = "text",
			val = dashboard.flavor_text,
			opts = {
				position = "center",
				hl = "Constant",
			},
		}

		local margin = {
			type = "padding",
			val = function()
				local height = vim.api.nvim_win_get_height(0)
				local occupied = #header.val + #info.val + #buttons.val + 1 + padding.val * 3
				local value = math.floor((height - occupied) / 2)
				return value >= 0 and value or 0
			end,
		}

		alpha.setup({
			layout = {
				margin,
				header,
				padding,
				info,
				padding,
				buttons,
				padding,
				footer,
			},
		})
		require("keybinds.plugins.alpha"):set()
	end,
}
