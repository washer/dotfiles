local map = require("config.map")

return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			require("trouble").setup({
				height = 30,
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
