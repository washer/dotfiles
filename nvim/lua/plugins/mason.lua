return {
	{
		"williamboman/mason.nvim",
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
	},
	-- use mason-lspconfig to configure LSP installations
	{
		"williamboman/mason-lspconfig.nvim",
		-- overrides `require("mason-lspconfig").setup(...)`
		opts = {
			ensure_installed = { "jsonls", "tsserver", "rust_analyzer", "sqlls" },
		},
	},
	-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
	{
		"jay-babu/mason-null-ls.nvim",
		-- overrides `require("mason-null-ls").setup(...)`
		opts = {
			ensure_installed = { "eslint_d", "fixjson", "rustfmt", "sql-formatter" },
			set,
		},
	},
}
