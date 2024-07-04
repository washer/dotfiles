local Job = require("plenary.job")
local math = require("math")
local string = require("string")

local binary_installed = false
local currently_playing = false
local current_title = ""
local current_artist = ""
local current_time = 0

local M = {}

local function disp_time(time)
	local minutes = math.floor((time % 3600) / 60)
	local seconds = math.floor(time % 60)
	return string.format("%02d:%02d", minutes, seconds)
end

local function get_playing_state_symbol()
	if currently_playing == true then
		return "▶"
	elseif currently_playing == false then
		return "⏸"
	else
		return ""
	end
end

local function start_state_job()
	Job:new({
		command = "nowplaying-cli",
		args = { "get", "playbackRate" },
		on_stdout = function(j, data)
			if data == "1" then
				currently_playing = true
			else
				currently_playing = false
			end
		end,
		on_exit = function()
			start_state_job()
		end,
	}):start()
end

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

-- TODO: It would be nicer if this could just run async once a second
local function start_time_job()
	Job:new({
		command = "nowplaying-cli",
		args = { "get", "elapsedTime" },
		on_stdout = function(j, data)
			if currently_playing == false then
				return
			end

			if data then
				current_time = data
			end
		end,
		on_exit = function()
			start_time_job()
		end,
	}):start()
end

local function init_nowplaying()
	if binary_installed == false then
		return
	end
	start_state_job()
	start_artist_job()
	start_title_job()
	start_time_job()
end

local function verify_binary()
	Job:new({
		command = "which",
		args = { "nowplaying-cli" },
		on_exit = function(j, return_val)
			if return_val ~= 0 then
				vim.notify("nowplaying-cli is not installed", vim.log.levels.ERROR)
			else
				binary_installed = true
				init_nowplaying()
			end
		end,
	}):start()
end

function M.getCurrentlyPlaying()
	-- TODO: add check for what parts we have and make it nice if we only have title
	return get_playing_state_symbol()
		.. " "
		.. current_artist
		.. " - "
		.. current_title
		.. " | "
		.. disp_time(current_time)
end

function M.nextSong()
	Job:new({
		command = "nowplaying-cli",
		args = { "next" },
	}):start()
end

function M.previousSong()
	Job:new({
		command = "nowplaying-cli",
		args = { "previous" },
	}):start()
end

verify_binary()
return M
