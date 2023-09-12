return {
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({
				display_virtual_text = 0,
			})
		end,
	},
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
