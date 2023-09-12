local git_blame = require("gitblame")

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
						lualine_c = {
							{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
						},
					},
				})
			end,
		},
	},
}
