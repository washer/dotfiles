return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"antoinemadec/FixCursorHold.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					open_on_setup = true,
					open_on_setup_file = false,
				},
				follow_current_file = {
					enabled = true,
				},
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = true,
			},
			window = {
				width = 30,
			},
		})
	end,
}
