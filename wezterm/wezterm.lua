-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
local act = wezterm.action
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "%",
		mods = "LEADER|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = '"',
		mods = "LEADER|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "o",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Next"),
	},
	{
		key = "z",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},
}

-- display preference
config.color_scheme = "Embers (dark)(terminal.sexy)"
config.font_size = 14
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.75

-- loading local configurationso
local localconf = require("localconf")
localconf.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
