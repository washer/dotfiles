return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
			-- HACK: remove when https://github.com/windwp/nvim-ts-autotag/issues/125 closed.
			{ "windwp/nvim-ts-autotag", opts = { autotag = { enable_close_on_slash = false } } },
		},
		cmd = {
			"TSBufDisable",
			"TSBufEnable",
			"TSBufToggle",
			"TSDisable",
			"TSEnable",
			"TSToggle",
			"TSInstall",
			"TSInstallInfo",
			"TSInstallSync",
			"TSModuleInfo",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
		},
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"go",
				"lua",
				"python",
				"rust",
				"typescript",
				"cmake",
				"bash",
				"html",
				"json",
				"markdown",
				"markdown_inline",
			},
		},
	},
	"nvim-treesitter/nvim-treesitter-context",
}
