vim.api.nvim_create_autocmd("Colorscheme", {
	callback = function(event)
		-- Better highlights for window separators when statusline is global
		if vim.o.laststatus == 3 then
			local hl_options = { link = "Title", default = false }

			vim.api.nvim_set_hl(0, "VertSplit", hl_options)
			vim.api.nvim_set_hl(0, "WinSeparator", hl_options)
		end

		if event.match == "calvera" then
			vim.cmd([[silent hi! link IblIndent Comment]])
		end
	end,
})
