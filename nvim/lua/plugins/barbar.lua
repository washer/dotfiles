local map = require("config.map")

return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			local wk = require("which-key")
			vim.g.barbar_auto_setup = false
			wk.register({
				["<leader>b"] = { name = "Buffers" },
				["<leader>bc"] = { name = "Close buffers" },
			})

			map.leader("n", "bco", "<cmd>BufferCloseAllButCurrent<cr>", "Close other buffers")
			map.leader("n", "bcl", "<cmd>BufferCloseBuffersRight<cr>", "Close buffers to the right")
			map.leader("n", "bch", "<cmd>BufferCloseBuffersLeft<cr>", "Close buffers to the left")
			map.leader("n", "bo", "<cmd>BufferPick<cr>", "Pick buffer")
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
					added = { enabled = true, icon = "" },
					changed = { enabled = true, icon = "" },
					deleted = { enabled = true, icon = "" },
				},
			},
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
}
