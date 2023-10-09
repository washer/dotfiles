return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					keymap = {
						accept = "<C-k>",
						accept_word = false,
						accept_line = false,
						next = "<C-h>",
						prev = "<C-l>",
						dismiss = "<C-j>",
					},
				},
				panel = { enabled = false },
			})
		end,
	},
}
