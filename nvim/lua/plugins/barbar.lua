local map = require("config.map")

return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			icons = {
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "" },
					[vim.diagnostic.severity.WARN] = { enabled = true, icon = "" },
					[vim.diagnostic.severity.INFO] = { enabled = true, info = "" },
					[vim.diagnostic.severity.HINT] = { enabled = true, info = "" },
				},
				gitsigns = {
					added = { enabled = true, icon = "" },
					changed = { enabled = true, icon = "" },
					deleted = { enabled = true, icon = "" },
				},
				preset = "slanted",
			},
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
		map.leader("n", "C", "<cmd>BufferCloseAllButCurrent<cr>"),
		map.leader("n", "Cl", "<cmd>BufferCloseBuffersRight<cr>"),
		map.leader("n", "Ch", "<cmd>BufferCloseBuffersLeft<cr>"),
		map.leader("n", "bo", "<cmd>BufferPick<cr>"),
	},
}
