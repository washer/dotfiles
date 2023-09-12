return {
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		config = function()
			require("toggleterm").setup({
				-- direction = "float",
				direction = "horizontal",
				size = 40,
			})
		end,
	},
}
