local map = require("config.map")

return {
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("telescope").load_extension("harpoon")
			map.leader("n", "hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")
			map.leader("n", "ha", "<cmd>lua require('harpoon.mark').add_file()<cr>")
		end,
	},
}