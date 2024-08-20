local git_blame = require("gitblame")
local nowplaying = require("tools.nowplaying")

local function executor()
	return require("executor").statusline()
end

local function repo()
	local cwd = vim.loop.cwd()
	local cwdsplit = vim.split(cwd, "/")
	return cwdsplit[#cwdsplit + 1 - 1]
end

return {
	{
		"tpope/vim-fugitive",
		{
			"nvim-lualine/lualine.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function(_, opts)
				local cyberdream = require("lualine.themes.cyberdream")
				require("lualine").setup({
					-- options = { theme = "auto", extensions = { "nvim-dap-ui" } },
					options = { theme = "cyberdream", extensions = { "nvim-dap-ui" } },
					sections = {
						lualine_b = { repo, "branch", "diff", "diagnostics" },
						lualine_c = {
							{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
						},
						lualine_x = {
							{
								"filename",
								path = 1,
							},
						},
						lualine_y = {
							"filetype",
							"progress",
						},
						lualine_z = {
							-- nowplaying.getCurrentlyPlaying,
						},
					},
				})
			end,
		},
	},
}
