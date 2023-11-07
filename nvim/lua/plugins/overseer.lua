local map = require("config.map")

-- local function open_last_as()
-- 	local overseer = require("overseer")
-- 	local last_task = overseer.list_tasks({
-- 		recent_first = true,
-- 	})[0]
-- end

return {
	"stevearc/overseer.nvim",
	opts = {},
	map.leader("n", "rr", "<cmd>OverseerRun<CR>", "Overseer run"),
	map.leader("n", "rt", "<cmd>OverseerOpen<CR>", "Overseer open"),
	map.leader("n", "rb", "<cmd>OverseerBuild<CR>", "Overseer build"),
}
