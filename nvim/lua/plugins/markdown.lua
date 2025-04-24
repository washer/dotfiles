local map = require("config.map")

return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false, -- Recommended
		config = function()
			require("markview").setup({
				map.leader("n", "mo", "<cmd> Markview toggleAll<cr>", "Open markdown preview"),
			})
		end,
	},
}
