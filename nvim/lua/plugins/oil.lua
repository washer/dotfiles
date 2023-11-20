local map = require("config.map")

return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()
			map.leader("n", "F", "<cmd>Oil --float<cr>", "Oil")
		end,
	},
}
