local wk = require("which-key")

wk.register({
	["<leader>d"] = { name = "Debugging" },
	["<leader>f"] = { name = "Files" },
	["<leader>h"] = { name = "Harpoon" },
	["<leader>o"] = { name = "Overseer" },
	["<leader>b"] = { name = "Buffers" },
	["<leader>bc"] = { name = "Close buffers" },
	["<leader>t"] = { name = "Test" },
	["<leader>p"] = { name = "Packages" },
	["<leader>l"] = { name = "Diagnostics" },
	["<leader>g"] = { name = "Git" },
	["<leader>a"] = { name = "Jump to definition" },
})
