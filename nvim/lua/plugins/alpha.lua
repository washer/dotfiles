return {
	"goolord/alpha-nvim",
	lazy = true,
	event = "VimEnter",
	opts = function()
		require("alpha")
		require("alpha.term")
		local dashboard = require("alpha.themes.dashboard")
		local logo = [[

   ▄▄▄▄▀ ▄  █ ▄█    ▄▄▄▄▄       ▄█    ▄▄▄▄▄       ▄████  ▄█    ▄   ▄███▄   
▀▀▀ █   █   █ ██   █     ▀▄     ██   █     ▀▄     █▀   ▀ ██     █  █▀   ▀  
    █   ██▀▀█ ██ ▄  ▀▀▀▀▄       ██ ▄  ▀▀▀▀▄       █▀▀    ██ ██   █ ██▄▄    
   █    █   █ ▐█  ▀▄▄▄▄▀        ▐█  ▀▄▄▄▄▀        █      ▐█ █ █  █ █▄   ▄▀ 
  ▀        █   ▐                 ▐                 █      ▐ █  █ █ ▀███▀   
          ▀                                         ▀       █   ██         

      ]]

		local function getGreeting(name)
			local tableTime = os.date("*t")
			local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
			local hour = tableTime.hour
			local greetingsTable = {
				[1] = "  Sleep well",
				[2] = "  Good morning",
				[3] = "  Good afternoon",
				[4] = "  Good evening",
				[5] = "󰖔  Good night",
			}
			local greetingIndex = 0
			if hour == 23 or hour < 7 then
				greetingIndex = 1
			elseif hour < 12 then
				greetingIndex = 2
			elseif hour >= 12 and hour < 18 then
				greetingIndex = 3
			elseif hour >= 18 and hour < 21 then
				greetingIndex = 4
			elseif hour >= 21 then
				greetingIndex = 5
			end
			return "\t" .. datetime .. "\t" .. greetingsTable[greetingIndex] .. ", " .. name
		end

		local userName = "Mads"
		local greeting = getGreeting(userName)
		local width = 46
		local height = 25

		dashboard.section.header.val = vim.split(logo .. "\n" .. greeting, "\n")
		dashboard.section.header.opts.hl = "DashboardHeader"
		dashboard.section.header.opts.position = "center"
		dashboard.section.terminal.command = "cat | ~/.config/nvim/lua/art/thisisfine.sh"
		dashboard.section.terminal.width = width
		dashboard.section.terminal.height = height
		dashboard.section.terminal.opts.redraw = true

		dashboard.section.buttons.val = {
			dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
			dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
			dashboard.button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
			dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
			dashboard.button("q", " " .. " Quit", ":qa<CR>"),
		}
		dashboard.config.layout = {
			{ type = "padding", val = 1 },
			dashboard.section.terminal,
			{ type = "padding", val = 5 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}

		return dashboard
	end,
	config = function(_, opts)
		require("alpha").setup(opts.config)
	end,
}
