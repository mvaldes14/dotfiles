local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback({ "JetBrainsMono NF", "FiraCode Nerd Font", "Hack" })
config.font_size = 20
config.line_height = 1.0
config.window_background_opacity = 0.95
config.enable_scroll_bar = false
config.enable_tab_bar = false
config.color_scheme = "tokyonight_night"
config.adjust_window_size_when_changing_font_size = false
config.default_prog = { 'tmux' }
config.detect_password_input = true
config.colors = {
	background = "#1a1b26",
}
config.window_padding = {
	top = 5,
	bottom = 1,
	left = 10,
	right = 10,
}


config.warn_about_missing_glyphs = false
config.default_domain = 'WSL:NixOS'

return config
