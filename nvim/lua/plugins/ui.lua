local map = require("config.map")

return {
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"nvim-neotest/nvim-nio",
	},
	{
		"nvim-tree/nvim-web-devicons",
		enabled = vim.g.icons_enabled,
		opts = {
			override = {
				deb = { icon = "", name = "Deb" },
				lock = { icon = "󰌾", name = "Lock" },
				mp3 = { icon = "󰎆", name = "Mp3" },
				mp4 = { icon = "", name = "Mp4" },
				out = { icon = "", name = "Out" },
				["robots.txt"] = { icon = "󰚩", name = "Robots" },
				ttf = { icon = "", name = "TrueTypeFont" },
				rpm = { icon = "", name = "Rpm" },
				woff = { icon = "", name = "WebOpenFontFormat" },
				woff2 = { icon = "", name = "WebOpenFontFormat2" },
				xz = { icon = "", name = "Xz" },
				zip = { icon = "", name = "Zip" },
			},
		},
	},
	{
		"onsails/lspkind.nvim",
		opts = {
			mode = "symbol",
			symbol_map = {
				Array = "󰅪",
				Boolean = "⊨",
				Class = "󰌗",
				Constructor = "",
				Key = "󰌆",
				Namespace = "󰅪",
				Null = "NULL",
				Number = "#",
				Object = "󰀚",
				Package = "󰏗",
				Property = "",
				Reference = "",
				Snippet = "",
				String = "󰀬",
				TypeParameter = "󰊄",
				Unit = "",
				Copilot = "",
			},
			menu = {},
		},
		enabled = vim.g.icons_enabled,
		config = function(_, opts)
			require("lspkind").init(opts)
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "▏",
			},
			exclude = {
				filetypes = {
					"help",
					"startify",
					"aerial",
					"alpha",
					"dashboard",
					"lazy",
					"neogitstatus",
					"NvimTree",
					"neo-tree",
					"Trouble",
					"Telescope",
				},
				buftypes = {
					"nofile",
					"terminal",
				},
			},
		},
	},
	{
		"MunifTanjim/nui.nvim",
	},
}
