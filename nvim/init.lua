-- Essentials
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.bulitin_lsp = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.g.sql_type_default = "mysql"
vim.g.use_custom_notifier = true

require("mappings")

-- We don't want tsserver to format stuff as the default formatting doesn't
-- seem to respect project-local settings for eslint and prettier. Instead, we
-- implicitly rely on null-ls formatting
local function lsp_format_wrapper()
	vim.lsp.buf.format({
		filter = function(client)
			return client.name ~= "tsserver"
		end,
	})
end

-- autocmds
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = lsp_format_wrapper,
})

-- Plugins
vim.loader.enable() -- cache lua modules (https://github.com/neovim/neovim/pull/22668)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = false,
	},
})

-- Theme
-- vim.cmd([[colorscheme kanagawa]])

-- Behaviors
vim.opt.belloff = "all"
vim.opt.completeopt = { "menuone", "noselect" } -- ins-completion how I like it
vim.opt.swapfile = false -- no swap files
vim.opt.inccommand = "nosplit" -- preview %s commands live as I type
vim.opt.undofile = true -- keep track of my 'undo's between sessions
-- vim.opt.grepprg = "rg --vimgrep --smart-case --no-heading" -- search with rg
-- vim.opt.grepformat = "%f:%l:%c:%m" -- filename:line number:column number:error message
vim.opt.foldlevel = 0 -- allow folding the whole way down
vim.opt.foldlevelstart = 99 -- open files with all folds open
vim.opt.splitright = true -- prefer vsplitting to the right
vim.opt.splitbelow = true -- prefer splitting below
vim.opt.splitkeep = "screen" -- keep text on screen the same when splitting
vim.opt.wrap = false -- don't wrap my text
vim.opt.linebreak = true -- if I toggle `wrap` ON, only break between words

-- Indentation
vim.opt.autoindent = true -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab = true -- <Tab> at the start of a line behaves as expected
vim.opt.expandtab = true -- <Tab> inserts spaces
vim.opt.shiftwidth = 2 -- >>, << shift line by 4 spaces
vim.opt.tabstop = 2 -- <Tab> appears as 4 spaces
vim.opt.softtabstop = 2 -- <Tab> behaves as 4 spaces when editing

-- Look and feel
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes" -- show the sign column always
vim.opt.list = true -- show list chars
vim.opt.listchars = {
	-- these list chars
	tab = "<->",
	nbsp = "␣",
	extends = "…",
	precedes = "…",
	trail = "·",
	multispace = "·", -- show chars if I have multiple spaces between text
	leadmultispace = " ", -- ...but don't show any when they're at the start
}

vim.opt.cursorline = true -- hightlight line cursor is on
vim.opt.laststatus = 3 -- single global statusline

-- Searching
vim.opt.wildmenu = true -- tab complete on command line
vim.opt.ignorecase = true -- case insensitive search...
vim.opt.smartcase = true -- unless I use caps

vim.opt.incsearch = true -- update results while I type

require("mappings")
require("config.lsp")
require("config.dap")
require("config.diagnostic")
require("config.which-key")
