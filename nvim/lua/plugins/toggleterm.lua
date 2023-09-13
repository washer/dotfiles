return {
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		opts = {
			highlights = {
				Normal = { link = "Normal" },
				NormalNC = { link = "NormalNC" },
				NormalFloat = { link = "NormalFloat" },
				FloatBorder = { link = "FloatBorder" },
				StatusLine = { link = "StatusLine" },
				StatusLineNC = { link = "StatusLineNC" },
				WinBar = { link = "WinBar" },
				WinBarNC = { link = "WinBarNC" },
			},
			on_create = function()
				vim.opt.foldcolumn = "0"
				vim.opt.signcolumn = "no"
			end,
			shading_factor = 2,
			direction = "float",
			float_opts = { border = "rounded" },
		},
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
