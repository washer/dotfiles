local map = require("config.map")

return function()
	require("gitsigns").setup({
		map.leader("n", "gl", function()
			require("gitsigns").blame_line()
		end, "View Git blame"),
	})
end
