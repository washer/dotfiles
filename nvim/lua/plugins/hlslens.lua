local map = require("config.map")

return {
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()
			map.set("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
			map.set("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]])
			map.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]])
			map.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]])
			map.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]])
			map.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]])
			map.leader("n", "ac", "<Cmd>noh<CR>", "Stop search")
		end,
	},
}
