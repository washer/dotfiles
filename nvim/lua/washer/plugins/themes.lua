return {
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
