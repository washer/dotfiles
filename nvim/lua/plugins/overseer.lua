local map = require("config.map")

return {
	{
		"stevearc/overseer.nvim",
		opts = {},
		config = function()
			require("overseer").setup({
				strategy = "toggleterm",
			})
			map.leader("n", "ot", "<cmd>OverseerToggle<cr>")
			map.leader("n", "or", "<cmd>OverseerRun<cr>")
		end,
	},
}
