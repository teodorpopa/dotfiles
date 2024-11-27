local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local window = mux.spawn_window({})
	window:gui_window():maximize()
end)

local padding = 10

local window_padding = {
	left = padding,
	right = padding,
	top = padding,
	bottom = padding,
}

local M = {
	window_padding = window_padding,
	inactive_pane_hsb = {
		saturation = 0.3,
		brightness = 0.6,
	},
	adjust_window_size_when_changing_font_size = false,
}

return M
