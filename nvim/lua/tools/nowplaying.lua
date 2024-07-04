local Job = require("plenary.job")
local async = require("plenary.async")
local math = require("math")
local string = require("string")

local binary_installed = false
local currently_playing = false
local current_title = ""
local current_artist = ""
local current_time = 0
local current_duration = 0

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

local function update_song_duration()
	Job:new({
		command = "nowplaying-cli",
		args = { "get", "duration" },
		on_stdout = function(j, data)
			current_duration = data
		end,
	}):start()
end

local function state_job()
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
	}):start()
end

local function artist_job()
	Job:new({
		command = "nowplaying-cli",
		args = { "get", "artist" },
		on_stdout = function(j, data)
			if data and data ~= current_artist then
				current_artist = data
			end
		end,
	}):start()
end

local function title_job()
	Job:new({
		command = "nowplaying-cli",
		args = { "get", "title" },
		on_stdout = function(j, data)
			if data and data ~= current_title then
				current_title = data
				update_song_duration()
			end
		end,
	}):start()
end

local function time_job()
	Job:new({
		command = "nowplaying-cli",
		args = { "get", "elapsedTime" },
		on_stdout = function(j, data)
			if data then
				if currently_playing == false then
					return
				end

				current_time = data
			end
		end,
	}):start()
end

local function update_state()
	local timer = vim.uv.new_timer()
	timer:start(
		0,
		500,
		vim.schedule_wrap(function()
			state_job()
			artist_job()
			title_job()
			time_job()
		end)
	)
end

local function init_nowplaying()
	if binary_installed == false then
		return
	end

	update_state()
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
	--
	if current_artist == "" then
		return get_playing_state_symbol()
			.. " "
			.. current_title
			.. " | "
			.. disp_time(current_time)
			.. "/"
			.. disp_time(current_duration)
	end

	return get_playing_state_symbol()
		.. " "
		.. current_artist
		.. " - "
		.. current_title
		.. " | "
		.. disp_time(current_time)
		.. "/"
		.. disp_time(current_duration)
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
