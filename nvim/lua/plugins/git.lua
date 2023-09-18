local map = require("config.map")

local current_line = function()
	local line = vim.fn.line(".")
	return line
end

local current_visual_lines = function()
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")
	return start_line .. "," .. end_line
end

return {
	{
		"tpope/vim-fugitive",
		dependencies = { "tpope/vim-rhubarb" },

		map.leader("n", "gr", function()
			vim.cmd(current_line() .. "GBrowse")
		end, "Open current line in remote"),

		map.leader("n", "gl", function()
			vim.cmd(current_line() .. "GBrowse!")
		end, "Copy current line in remote to clipboard"),
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({
				display_virtual_text = 0,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = require("config.gitsigns"),
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		map.leader("n", "gg", "<cmd>lua require('lazygit').lazygit()<cr>", "Lazy Git"),
	},
}
