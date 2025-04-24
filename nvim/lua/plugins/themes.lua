return {
	{
		"AlexvZyl/nordic.nvim",
		config = function()
			require("nordic").setup({
				leap = {
					-- Dims the backdrop when using leap.
					dim_backdrop = true,
				},
			})
		end,
	},
	"neanias/everforest-nvim",
	{ "Everblush/nvim", name = "everblush" },
	"titanzero/zephyrium",
	"ribru17/bamboo.nvim",
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "storm",
				light_style = "day",
			})
		end,
	},
	"theniceboy/nvim-deus",
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
					cmp = true,
					leap = true,
					treesitter = true,
					whichkey = true,
					gitsigns = true,
				},
			})
		end,
	},
	"ful1e5/onedark.nvim",
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				leap = {
					-- Dims the backdrop when using leap.
					dim_backdrop = true,
				},
				dimInactive = true,
			})
			require("kanagawa").load("wave")
		end,
	},
}
