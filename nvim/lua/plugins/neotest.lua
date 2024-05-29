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
				lazy = false,
				icons = {
					failed = "x",
					passed = "✓",
					running = "",
					skipped = "",
					unknown = "?",
					watching = "👀",
				},
				output = {
					enabled = false,
				},
				adapters = {
					require("neotest-jest")({
						jestConfig = "jest --watch ",
					}),
				},
			})
			map.leader("n", "tf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', "Run tests in file")
			map.leader("n", "tt", function()
				-- Toggle trouble and test summary
				require("trouble").toggle()
				require("neotest").summary.toggle()
			end, "Toggle test UI")
			map.leader("n", "tn", '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', "Run nearest test")
			map.leader(
				"n",
				"twf",
				'<cmd>lua require("neotest").watch.watch(vim.fn.expand("%"))<cr>',
				"Watch tests in file"
			)
			map.leader("n", "twn", '<cmd>lua require("neotest").watch.watch()<cr>', "Watch nearest test")
			map.leader("n", "tws", '<cmd>lua require("neotest").watch.stop()<cr>', "Stop watching all tests")
			map.leader("n", "ts", '<cmd>lua require("neotest").summary.toggle()<CR>', "Toggle summary")
			map.leader("n", "to", '<cmd>lua require("neotest").output.open({ enter = true })<CR>', "Open test output")
		end,
	},
}
