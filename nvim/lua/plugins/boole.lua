return {
	{
		"nat-418/boole.nvim",
		config = function()
			require("boole").setup({
				mappings = {
					increment = "<c-a>",
					decrement = "<c-x>",
				},
			})
		end,
	},
}
