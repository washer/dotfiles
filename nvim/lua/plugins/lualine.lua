return {
	{
		"tpope/vim-fugitive",
		{
			"nvim-lualine/lualine.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			options = { theme = "everforest" },
			config = function(_, opts)
				require("lualine").setup({
					sections = {
						lualine_x = { "overseer" },
						lualine_z = { "fugitive" },
					},
				})
			end,
		},
	},
}
