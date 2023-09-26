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
				preset_commands = {
					["api"] = {
						"npm run test && npm run test-integration && npm run build && npm run lint",
						"npm run test-integration",
					},
					[""] = {
						"npm run test && npm run build && npm run lint",
						"npm run test",
						"npm run build",
						"npm run lint",
					},
				},
			})
		end,
		map.leader("n", "rr", "<cmd>ExecutorShowPresets<CR>", "Executor run"),
		map.leader("n", "rs", "<cmd>ExecutorSetCommand<CR>", "Set Executor command"),
		map.leader("n", "rt", "<cmd>ExecutorToggleDetail<CR>", "Executor details"),
	},
}
