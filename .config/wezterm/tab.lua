local wezterm = require("wezterm")

local CONFIG = {
	padding = 2,
}

function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
	local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

	local index = tab.tab_index + 1
	local pad = string.rep(" ", CONFIG.padding)
	local title = tab_title(tab)
	local tab_title = string.format("%s%d  :   %s%s  ", pad, index, title, pad)

	local bg_active = "#195465"
	local fg_active = "#98D1CE"

	local bg_inactive = "#0A0F14"
	local fg_inactive = "#4E5165"

	if tab.is_active then
		return {
			{ Background = { Color = bg_active } },
			{ Foreground = { Color = bg_inactive } },
			{ Text = SOLID_LEFT_ARROW },
			{ Background = { Color = bg_active } },
			{ Foreground = { Color = fg_active } },
			{ Text = tab_title },
			{ Background = { Color = bg_inactive } },
			{ Foreground = { Color = bg_active } },
			{ Text = SOLID_RIGHT_ARROW },
		}
	else
		return {
			{ Background = { Color = bg_inactive } },
			{ Foreground = { Color = bg_inactive } },
			{ Text = SOLID_LEFT_ARROW },
			{ Background = { Color = bg_inactive } },
			{ Foreground = { Color = fg_inactive } },
			{ Text = tab_title },
			{ Background = { Color = bg_inactive } },
			{ Foreground = { Color = bg_inactive } },
			{ Text = SOLID_RIGHT_ARROW },
		}
	end
end)

return {
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	tab_max_width = 36,
}
