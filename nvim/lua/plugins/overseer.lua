local map = require("config.map")
local wk = require("which-key")

return {
	{
		"stevearc/overseer.nvim",
		opts = {},
		config = function()
			require("overseer").setup({
				strategy = {
					"toggleterm",
					-- have the toggleterm window close and delete the terminal buffer
					-- automatically after the task exits
					close_on_exit = false,
					quit_on_exit = false,
					-- open the toggleterm window when a task starts
					open_on_start = true,
				},
			})

			wk.register({
				["<leader>o"] = { name = "Overseer" },
			})
			map.leader("n", "ot", "<cmd>OverseerToggle<cr>", "Toggle Overseer")
			map.leader("n", "or", "<cmd>OverseerRun<cr>", "Run command with Overseer")
		end,
	},
}
