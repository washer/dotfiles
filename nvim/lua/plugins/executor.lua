local map = require("config.map")

return {
	{
		"google/executor.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("executor").setup({
				use_split = false,
			})
		end,
		map.leader("n", "rr", "<cmd>ExecutorRun<CR>", "Executor run"),
		map.leader("n", "rs", "<cmd>ExecutorSetCommand<CR>", "Set Executor command"),
		map.leader("n", "rt", "<cmd>ExecutorToggleDetail<CR>", "Executor details"),
	},
}
