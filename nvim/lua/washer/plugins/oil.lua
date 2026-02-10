return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				view_options = { show_hidden = true },
			})

			vim.keymap.set("n", "<leader>F", "<cmd>Oil --float<cr>")
		end,
	},
}
