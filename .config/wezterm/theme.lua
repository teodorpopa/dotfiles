local wezterm = require("wezterm")

local sync_with_system = false

local dark_theme = {
	"astromouse (terminal.sexy)",
	"Catppuccin Frappe",
	"Rosé Pine (base16)",
	"WildCherry",
	"nord",
	"Builtin Pastel Dark",
	"Brogrammer (base16)",
	"City Streets (terminal.sexy)",
	"Catppuccin Mocha",
	"Afterglow (Gogh)",
	"Apprentice (Gogh)",
	"AlienBlood",
	"Andromeda",
	"Apprentice (base16)",
	"Arthur (Gogh)",
	"Ashes (base16)",
	"Atelier Estuary (base16)",
	"Aurora",
	"Ayu Mirage (Gogh)",
	"Azu (Gogh)",
	"Batman",
	"Black Metal (base16)",
	"Black Metal (Venom) (base16)",
	"BlueDolphin",
	"Borland",
	"Breath (Gogh)",
	"Brush Trees Dark (base16)",
	"Canvased Pastel (terminal.sexy)",
	"Chalk",
	"City Lights (Gogh)",
	"cyberpunk",
	"darkmatrix",
	"DjangoSmooth",
	"Ef-Deuteranopia-Dark",
	"Ef-Maris-Dark",
	"Eva Dim (base16)",
	"Firewatch",
	"Freya (Gogh)",
	"FrontEndDelight",
	"Gotham (Gogh)",
	"Greenscreen (dark) (terminal.sexy)",
	"Greenscreen (light) (terminal.sexy)",
	"Guezwhoz",
	"HaX0R_BLUE",
	"HaX0R_GR33N",
	"HaX0R_R3D",
	"Horizon Dark (Gogh)",
	"Icy Dark (base16)",
	"Japanesque",
	"Kasugano (terminal.sexy)",
	"Lunaria Dark (Gogh)",
	"Macintosh (base16)",
	"Maia (Gogh)",
	"MaterialDesignColors",
	"matrix",
	"N0tch2k",
	"Navy and Ivory (terminal.sexy)",
	"Nebula (base16)",
	"Panels (terminal.sexy)",
	"Pnevma",
	"Red Phoenix (terminal.sexy)",
	"Seafoam Pastel",
	"SeaShells",
	"Selenized Black (Gogh)",
	"Shaman",
	"Spacedust",
	"Sweet Love (terminal.sexy)",
	"Tango (base16)",
	"terafox",
	"Tomorrow Night Blue",
	"Tomorrow Night Burns",
	"Treehouse",
	"Wryan",
	"zenwritten_dark",
}

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return dark_theme[math.random(#dark_theme)]
	end

	return dark_theme[math.random(#dark_theme)]
end

if sync_with_system then
	wezterm.on("window-config-reloaded", function(window)
		local overrides = window:get_config_overrides() or {}
		local appearance = window:get_appearance()
		local scheme = scheme_for_appearance(appearance)
		if overrides.color_scheme ~= scheme then
			overrides.color_scheme = scheme
			window:set_config_overrides(overrides)
		end
	end)
end

return {
	color_scheme = dark_theme[math.random(#dark_theme)],
}
