local map = require("config.map")

return {
	{
		"stevearc/dressing.nvim",
		opts = {},
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
		"folke/zen-mode.nvim",
		lazy = false,
		opts = {
			window = {
				width = 180,
			},
		},
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		config = function()
			require("transparent").setup({
				extra_groups = {
					"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
					"NvimTreeNormal", -- NvimTree
				},
			})
		end,
	},
	"RRethy/vim-illuminate",
	{
		"ziontee113/icon-picker.nvim",
		dependencies = {
			"stevearc/dressing.nvim",
		},
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
		map.leader("n", "]", "<cmd>IconPickerNormal<cr>", "Pick icon"),
	},
}
