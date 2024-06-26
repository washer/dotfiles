local wk = require("which-key")

wk.register({
	["<leader>d"] = { name = "Debugging" },
	["<leader>f"] = { name = "Files" },
	["<leader>fi"] = { name = "Find in" },
	["<leader>r"] = { name = "Executor" },
	["<leader>h"] = { name = "Harpoon" },
	["<leader>b"] = { name = "Buffers" },
	["<leader>bc"] = { name = "Close buffers" },
	["<leader>t"] = { name = "Test" },
	["<leader>p"] = { name = "Packages" },
	["<leader>l"] = { name = "Diagnostics" },
	["<leader>g"] = { name = "Git" },
	["<leader>a"] = { name = "Jump to definition" },
	["<leader>o"] = { name = "Orgmode" },
	["<leader>x"] = { name = "Trouble" },
	["<leader>m"] = { name = "Markdown" },
	["<leader>M"] = { name = "Music" },
})
