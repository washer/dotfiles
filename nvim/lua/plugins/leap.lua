local map = require("config.map")

return {
	{
		"ggandor/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
		config = function()
			map.set("n", "s", "<Plug>(leap-forward-to)")
			map.set("n", "S", "<Plug>(leap-backward-to)")
		end,
	},
}
