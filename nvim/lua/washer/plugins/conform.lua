return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			cpp = { "clang-format" },
			ex = { "mix format" },
			rust = { "rustfmt" },
			elixir = { "mix" },
			zig = { "zigfmt" },
			["*"] = { "codespell" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 5000,
			lsp_fallback = false,
		},
	},
}

