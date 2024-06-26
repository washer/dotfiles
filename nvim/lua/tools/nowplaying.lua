local async = require("plenary.async")
local Job = require("plenary.job")

local current_song = ""
local current_artist = ""

local M = {}

local function start_artist_job()
	Job:new({
		command = "nowplaying-cli",
		args = { "get", "artist" },
		on_stdout = function(j, data)
			if data and data ~= current_artist then
				current_artist = data
			end
		end,
		on_exit = function()
			start_artist_job()
		end,
	}):start()
end

local function start_title_job()
	Job:new({
		command = "nowplaying-cli",
		args = { "get", "title" },
		on_stdout = function(j, data)
			if data and data ~= current_title then
				current_title = data
			end
		end,
		on_exit = function()
			start_title_job()
		end,
	}):start()
end

function M.getCurrentlyPlaying()
	return current_artist .. " - " .. current_title
end

start_artist_job()
start_title_job()
return M
