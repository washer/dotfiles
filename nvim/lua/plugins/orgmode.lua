return {
	{
		"nvim-orgmode/orgmode.nvim",
		config = function()
			require("orgmode").setup_ts_grammar()
			require("orgmode").setup({})
		end,
	},
}
