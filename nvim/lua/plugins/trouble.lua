local map = require("config.map")

return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			local HEIGHT_RATIO = 0.2
			local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
			local window_h = screen_h * HEIGHT_RATIO
			local window_h_int = math.floor(window_h)
			require("trouble").setup({
				height = window_h_int,
			})
		end,

		map.leader("n", "xx", function()
			require("trouble").open()
		end, "List"),

		map.leader("n", "xd", function()
			require("trouble").open("document_diagnostics")
		end, "Document diagnostics"),

		map.leader("n", "xq", function()
			require("trouble").open("quickfix")
		end, "Quickfix"),

		map.leader("n", "xl", function()
			require("trouble").open("loclist")
		end, "Loclist"),
	},
}
