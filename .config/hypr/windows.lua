-- Per-app window rules (workspace assignment, float/maximize).
-- Required from ~/.config/hypr/hyprland.lua via require("hypr.windows").

o.window("steam", { float = false, maximize = true })
o.window("ghostty", { workspace = "1" })
-- Browser on workspace 2
o.window("([bB]rave-browser)", { workspace = "2" })
-- Steam on workspace 5
o.window("steam", { workspace = "5" })
