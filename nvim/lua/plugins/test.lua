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
						-- jestConfig = "jest --watch ",
						jestCommand = "npm test --",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
				consumers = {
					-- overseer = require("neotest.consumers.overseer"),
				},
				strategies = {
					integrated = {
						height = 40,
						width = 120,
					},
				},
				highlights = {
					adapter_name = "NeotestAdapterName",
					border = "NeotestBorder",
					dir = "NeotestDir",
					expand_marker = "NeotestExpandMarker",
					failed = "NeotestFailed",
					file = "NeotestFile",
					focused = "NeotestFocused",
					indent = "NeotestIndent",
					namespace = "NeotestNamespace",
					passed = "NeotestPassed",
					running = "NeotestRunning",
					skipped = "NeotestSkipped",
					test = "NeotestTest",
				},
				output = {
					enabled = true,
					open_on_run = true,
				},
				run = {
					enabled = true,
				},
				status = {
					enabled = true,
				},
				summary = {
					enabled = true,
					expand_errors = true,
					follow = true,
					mappings = {
						attach = "a",
						expand = { "<CR>", "<2-LeftMouse>" },
						expand_all = "e",
						jumpto = "i",
						output = "o",
						run = "r",
						short = "O",
						stop = "u",
					},
				},
			})
			map.leader("n", "tf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>')
			map.leader("n", "tn", '<cmd>lua require("neotest").run.run()<cr>')
			map.leader("n", "tw", '<cmd>lua require("neotest").watch()<cr>')
			map.leader("n", "ts", '<cmd>lua require("neotest").summary.toggle()<CR>')
			map.leader("n", "to", '<cmd>lua require("neotest").output.open({ enter = true })<CR>')
		end,
	},
}
