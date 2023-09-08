local keymap = vim.keymap

keymap.set("n", "<Leader>w", "<cmd>w<cr>", { silent = true })
keymap.set("n", "<Leader>q", "<cmd>q<cr>", { silent = true })
keymap.set("n", "<Leader>c", "<cmd>bd<cr>", { silent = true })

-- Plugins

-- Telescope
keymap.set("n", "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { silent = true })
keymap.set("n", "<Leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { silent = true })
keymap.set("n", "<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { silent = true })
keymap.set("n", "<Leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", { silent = true })

keymap.set("n", "<Leader>fn", "<cmd>lua require('telescope').extensions.notify.notify(<opts>)<cr>", { silent = true })

-- NeoTree
keymap.set("n", "<Leader>e", "<cmd>Neotree toggle<cr>", { silent = true })

-- Comment
keymap.set(
	"n",
	"<Leader>/",
	"<cmd>lua require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)<cr>",
	{ silent = true }
)
keymap.set(
	"v",
	"<Leader>/",
	"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
	{ silent = true }
)

-- Mason
keymap.set("n", "<Leader>pm", "<cmd>Mason<cr>", { silent = true })

-- Lazy git
keymap.set("n", "<Leader>gg", "<cmd>lua require('lazygit').lazygit()<cr>", { silent = true })
