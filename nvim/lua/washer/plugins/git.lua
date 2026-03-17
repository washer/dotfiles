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
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		vim.keymap.set("n", "<leader>gg", "<cmd>lua require('lazygit').lazygit()<cr>"),
	},
	{
		"tpope/vim-fugitive",
		dependencies = { "tpope/vim-rhubarb" },

		vim.keymap.set("n", "<leader>gr", function()
			vim.cmd(current_line() .. "GBrowse")
		end),

		vim.keymap.set("n", "<leader>gc", function()
			vim.cmd(current_line() .. "GBrowse!")
		end),

		vim.keymap.set("n", "<leader>gl", "<cmd>Gclog<cr>"),
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
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text_pos = "eol",
					delay = 200,
				},
				word_diff = false,
				vim.keymap.set("n", "<leader>gd", require("gitsigns").diffthis),
				vim.keymap.set("n", "<leader>ghp", require("gitsigns").preview_hunk_inline),
			})
		end,
	},
	{
		"benomahony/oil-git.nvim",
		dependencies = { "stevearc/oil.nvim" },
		-- No opts or config needed! Works automatically
	},
}
