local map = require("config.map")

return {
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("telescope").load_extension("harpoon")
			map.leader("n", "hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Quick menu")
			map.leader("n", "ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file")
			map.leader("n", "hl", "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next file")
			map.leader("n", "hh", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous file")

			--
			for i = 1, 9, 1 do
				map.leader(
					"n",
					"h" .. i,
					"<cmd>lua require('harpoon.ui').nav_file(" .. i .. ")<cr>",
					"Go to file number " .. i
				)
			end
		end,
	},
}
