return {
	{
		"AlexvZyl/nordic.nvim",
		config = function()
			require("nordic").setup({
				leap = {
					-- Dims the backdrop when using leap.
					dim_backdrop = true,
				},
			})
		end,
	},
	"neanias/everforest-nvim",
	{ "Everblush/nvim", name = "everblush" },
	"titanzero/zephyrium",
	"ribru17/bamboo.nvim",
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "storm",
				light_style = "day",
			})
		end,
	},
	"theniceboy/nvim-deus",
	"ful1e5/onedark.nvim",
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				leap = {
					-- Dims the backdrop when using leap.
					dim_backdrop = true,
				},
				dimInactive = true,
				overrides = function(colors)
					local theme = colors.theme
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
					}
				end,
			})
			require("kanagawa").load("wave")
		end,
	},
}
