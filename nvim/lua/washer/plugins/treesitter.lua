return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		-- Temporary fix for https://github.com/nvim-treesitter/nvim-treesitter/issues/3232
		require("nvim-treesitter.install").prefer_git = true

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"cpp",
				"fish",
				"gitcommit",
				"git_rebase",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"sql",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite" },
			},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
				disable = {},
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<cr>",
					node_incremental = "<cr>",
					scope_incremental = "<s-cr>",
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["an"] = "@number.inner",
						["in"] = "@number.inner",
						["ag"] = "@comment.outer",
						["ig"] = "@comment.outer",
						["ac"] = "@conditional.outer",
						["ic"] = "@conditional.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
					},
					selection_modes = {
						["@function.inner"] = "V",
						["@function.outer"] = "V",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<localleader>al"] = "@parameter.inner",
					},
					swap_previous = {
						["<localleader>ah"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["<localleader>fn"] = "@function.outer",
						["<localleader>an"] = "@parameter.inner",
					},
					goto_previous_start = {
						["<localleader>fp"] = "@function.outer",
						["<localleader>ap"] = "@parameter.inner",
					},
				},
			},
			endwise = {
				enable = true,
			},
		})
	end,
}
