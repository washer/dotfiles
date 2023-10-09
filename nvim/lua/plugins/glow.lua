local map = require("config.map")

return {
	{

		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
		config = function()
			require("glow").setup({
				width_ratio = 0.8,
				height_ratio = 0.8,
			})
		end,
		map.leader("n", "mo", "<cmd>Glow<cr>", "Open markdown preview"),
	},
}
