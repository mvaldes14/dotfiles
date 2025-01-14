local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "JetBrainsMono NF" })
config.font_size = 20
config.line_height = 1.0
config.enable_scroll_bar = false
config.color_scheme = "tokyonight_night"
config.adjust_window_size_when_changing_font_size = false
config.detect_password_input = true
config.warn_about_missing_glyphs = false
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
config.macos_window_background_blur = 20

config.warn_about_missing_glyphs = false
config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
	regex = [[(?i)liops-(\d+)]],
	format = "https://jira.tools.bestbuy.com/browse/LIOPS-$1",
})
table.insert(config.hyperlink_rules, {
	regex = [[(?i)iip-(\d+)]],
	format = "https://jira.tools.bestbuy.com/browse/IIP-$1",
})

config.quick_select_patterns = {
	"[https://][a-zA-Z0-9.-]{7,40}",
	"\b(?:d{1,3}.){3}d{1,3}\b",
}

return config
