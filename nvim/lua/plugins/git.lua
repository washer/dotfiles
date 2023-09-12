return {
	{
		"lewis6991/gitsigns.nvim",
		config = require("config.gitsigns"),
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
