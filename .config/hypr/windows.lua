-- Per-app window rules (workspace assignment, float/maximize).
-- Required from ~/.config/hypr/hyprland.lua via require("hypr.windows").

o.window("ghostty", { workspace = "1" })
-- Browser on workspace 2
o.window("([bB]rave-browser)", { workspace = "2" })
-- Obsidian on workspace 3
o.window("(obsidian|md\\.obsidian\\.Obsidian)", { workspace = "3" })
-- Spotify and OBS on workspace 4
o.window("[sS]potify", { workspace = "4" })
o.window("(com\\.obsproject\\.Studio|^obs$)", { workspace = "4" })
-- Browser extension popups (Bitwarden, etc.): float and center instead of
-- tiling as a full window. Chromium/Brave names these windows "_crx_<id>".
o.window({ initial_title = "^_crx_" }, { float = true, center = true })

-- Steam and Deadlock on workspace 5
o.window("steam", { workspace = "5", float = false, maximize = true })
o.window({ title = "Deadlock" }, { workspace = "5" })
