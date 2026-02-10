return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "junegunn/fzf" },
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
