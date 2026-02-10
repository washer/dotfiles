return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		vim.keymap.set("n", "<leader>gg", "<cmd>lua require('lazygit').lazygit()<cr>"),
	},
}
