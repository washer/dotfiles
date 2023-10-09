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

			map.leader("n", "bca", "<cmd>%bd<cr>", "Close all buffers")
			map.leader("n", "bco", "<cmd>BufferCloseAllButCurrent<cr>", "Close other buffers")
			map.leader("n", "bcl", "<cmd>BufferCloseBuffersRight<cr>", "Close buffers to the right")
			map.leader("n", "bch", "<cmd>BufferCloseBuffersLeft<cr>", "Close buffers to the left")
			map.leader("n", "bo", "<cmd>BufferPick<cr>", "Pick buffer")
			map.leader("n", "bmh", "<cmd>BufferPrevious<cr>", "Move to previous buffer")
			map.leader("n", "bml", "<cmd>BufferNext<cr>", "Move to next buffer")
		end,
		opts = {
			highlight_visible = false,
			icons = {
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "" },
					[vim.diagnostic.severity.WARN] = { enabled = true, icon = "" },
					[vim.diagnostic.severity.INFO] = { enabled = true, info = "" },
					[vim.diagnostic.severity.HINT] = { enabled = true, info = "" },
				},
				gitsigns = {
					added = { enabled = true, icon = "洛" },
					changed = { enabled = true, icon = "" },
					deleted = { enabled = true, icon = "" },
				},
			},
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
}
