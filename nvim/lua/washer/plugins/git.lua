return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		vim.keymap.set("n", "<leader>gg", "<cmd>lua require('lazygit').lazygit()<cr>"),
	},
	{
		"tpope/vim-fugitive",
		dependencies = { "tpope/vim-rhubarb" },

		vim.keymap.set("n", "<leader>gr", function()
			vim.cmd(current_line() .. "GBrowse")
		end),

		vim.keymap.set("n", "<leader>gc", function()
			vim.cmd(current_line() .. "GBrowse!")
		end),

		vim.keymap.set("n", "<leader>gl", "<cmd>Gclog<cr>"),
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({
				display_virtual_text = 0,
			})
		end,
	},
}
