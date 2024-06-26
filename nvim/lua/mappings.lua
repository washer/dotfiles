local map = require("config.map")

map.leader("n", "w", "<cmd>w<cr>", "Save buffer")
map.leader("n", "q", "<cmd>q<cr>", "Quit window")
map.leader("n", "c", "<cmd>bd<cr>", "Close buffer")
map.leader("n", "R", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename variable")

-- Plugins
-- Lazy
map.leader("n", "pl", "<cmd>Lazy<cr>")

-- Telescope
map.leader("n", "ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files")
map.leader(
	"n",
	"fh",
	"<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<cr>",
	"Find including hidden files"
)
map.leader("n", "fw", "<cmd>lua require('telescope.builtin').live_grep({})<cr>", "Live grep")
map.leader("n", "fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", "Find buffers")
map.leader("n", "fm", "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Man pages")
map.leader(
	"n",
	"fd",
	"<cmd>lua require('telescope.builtin').live_grep({search_dirs = { vim.fn.expand('%:p:h') },})<cr>",
	"Find in current directory"
)
map.leader(
	"n",
	"fit",
	"<cmd>lua require('telescope.builtin').live_grep({glob_pattern='*.{test,it}*'})<cr>",
	"Find in test files"
)
map.leader(
	"n",
	"fii",
	"<cmd>lua require('telescope.builtin').live_grep({glob_pattern='*.{it}*'})<cr>",
	"Find in integration test files"
)
map.leader(
	"n",
	"fif",
	"<cmd>lua require('telescope.builtin').live_grep({glob_pattern='!*.{test,it}*'})<cr>",
	"Find in non-test files"
)
map.leader("n", "fc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", "Colorschemes")
map.leader("n", "fa", "<cmd>lua require('telescope').extensions.aerial.aerial()<cr>", "Aerial")
map.leader("n", "ft", "<cmd>TodoTelescope<cr>", "Todos")

-- NvimTree
map.leader("n", "e", "<cmd>NvimTreeFindFileToggle<cr>", "File tree")

-- Comment
map.leader(
	"n",
	"/",
	"<cmd>lua require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)<cr>",
	"Toggle comment"
)
map.leader("v", "/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", "Toggle comment")

-- Mason
map.leader("n", "pm", "<cmd>Mason<cr>")

-- Nowplaying
map.leader("n", "Ml", "<cmd>lua require('tools.nowplaying').nextSong()<cr>", "Next song")
map.leader("n", "Mh", "<cmd>lua require('tools.nowplaying').previousSong()<cr>", "Previous song")
