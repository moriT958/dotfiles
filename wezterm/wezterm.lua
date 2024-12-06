-- Pull in the wezterm API
local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, _)
	-- "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M ")

	local bat = ""
	for _, b in ipairs(wezterm.battery_info()) do
		bat = "[🔋" .. string.format("%.0f%%]", b.state_of_charge * 100)
	end

	window:set_right_status(wezterm.format({
		{ Text = bat .. "   " .. date },
	}))
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.93
config.font_size = 10.5
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.initial_cols = 200
config.initial_rows = 55

-- and finally, return the configuration to wezterm
return config
