return {
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		config = function()
			require("toggleterm").setup({
				direction = "float",
				-- direction = "horizontal",
				size = 40,
				quit_on_exit = false,
				close_on_exit = false,
			})
		end,
	},
}
