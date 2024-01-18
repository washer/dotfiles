return {
	{
		"williamboman/mason.nvim",
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	-- use mason-lspconfig to configure LSP installations
	{
		"williamboman/mason-lspconfig.nvim",
		-- overrides `require("mason-lspconfig").setup(...)`
		opts = {
			ensure_installed = { "jsonls", "tsserver", "rust_analyzer", "sqlls" },
		},
	},
}
