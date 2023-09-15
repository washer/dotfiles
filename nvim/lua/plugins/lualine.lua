local git_blame = require("gitblame")

return {
	{
		"tpope/vim-fugitive",
		{
			"nvim-lualine/lualine.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function(_, opts)
				require("lualine").setup({
					options = { theme = "auto", extensions = { "nvim-dap-ui" } },
					sections = {
						lualine_c = {
							{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
						},
						lualine_x = {
							{
								"filename",
								path = 1,
							},
						},
						lualine_y = { "overseer" },
					},
				})
			end,
		},
	},
}
