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
						-- jestCommand = "npm test --",
						jestConfig = "jest --watch ",
						-- jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
				consumers = {
					overseer = require("neotest.consumers.overseer"),
				},
			})
			map.leader("n", "tf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>')
			map.leader("n", "tn", '<cmd>lua require("neotest").run.run()<cr>')
		end,
	},
}
