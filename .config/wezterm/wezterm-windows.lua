local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Regular configs
config.font = wezterm.font_with_fallback({ "JetBrainsMono NF", "FiraCode Nerd Font", "Hack" })
config.font_size = 20
config.line_height = 1.0
config.enable_scroll_bar = false
config.color_scheme = "tokyonight_night"
config.adjust_window_size_when_changing_font_size = true
config.detect_password_input = true
config.warn_about_missing_glyphs = false
config.max_fps = 240
config.colors = {
	background = "#1a1b26",
}
config.window_background_opacity = 0.95
config.window_padding = {
	top = 5,
	bottom = 1,
	left = 10,
	right = 10,
}
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_kitty_graphics = true

-- Hyperlink rules
config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
	regex = [[(?i)tw-(\d+)]],
	format = "https://linear.app/mvaldes/issues/TW-$1",
})

-- WSL
config.default_domain = "WSL:NixOS"
config.wsl_domains = {
	{
		name = "WSL:NixOS",
		distribution = "NixOS",
	},
}

return config

