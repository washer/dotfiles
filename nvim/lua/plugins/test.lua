local map = require("config.map")

return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({
						jestConfig = "jest --watch ",
					}),
				},
				consumers = {
					-- overseer = require("neotest.consumers.overseer"),
					watch,
					summary,
					diagnostic,
				},
			})
			map.leader("n", "tf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>')
			map.leader("n", "tn", '<cmd>lua require("neotest").run.run()<cr>')
			map.leader("n", "tw", '<cmd>lua require("neotest").watch()<cr>')
		end,
	},
}
