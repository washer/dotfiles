return {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
				transparent_background_level = 1,
			})
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local colors = require("cyberdream.colors").default
			require("cyberdream").setup({
				transparent = true,
				italic_comments = true,
				borderless_telescope = false,
				theme = {
					highlights = {
						Identifier = { fg = colors.orange },
					},
				},
				extensions = {
					telescope = true,
					notify = true,
					-- cmp = true,
					leap = true,
					treesitter = true,
					whichkey = true,
					gitsigns = true,
				},
			})
		end,
	},
}
