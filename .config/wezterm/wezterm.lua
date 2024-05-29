local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback({ "JetBrainsMono NF", "FiraCode Nerd Font", "Hack" })
config.font_size = 20
config.line_height = 1.0
config.window_background_opacity = 0.97
config.enable_scroll_bar = false
config.color_scheme = "tokyonight_night"
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = true
config.enable_tab_bar = false
config.window_padding = {
	top = 5,
	bottom = 1,
	left = 10,
	right = 10,
}

config.warn_about_missing_glyphs = false
config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
	regex = [[(?i)liops-(\d+)]],
	format = "https://code.bestbuy.com/jira/browse/LIOPS-$1",
})
table.insert(config.hyperlink_rules, {
	regex = [[(?i)iip-(\d+)]],
	format = "https://code.bestbuy.com/jira/browse/IIP-$1",
})
table.insert(config.hyperlink_rules, {
	regex = [[(?i)tw-(\d+)]],
	format = "https://linear.app/mvaldes/issues/TW-$1",
})

return config
