require("washer.remap")
require("washer.config.lazy")
require("washer.config.lsp")

vim.cmd([[colorscheme cyberdream]])

-- Essentials
vim.g.maplocalleader = " "
vim.g.bulitin_lsp = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.g.sql_type_default = "mysql"
vim.g.use_custom_notifier = true

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 16
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.belloff = "all"
vim.opt.swapfile = false -- no swap files
vim.opt.inccommand = "nosplit" -- preview %s commands live as I type
vim.opt.undofile = true -- keep track of my 'undo's between sessions
