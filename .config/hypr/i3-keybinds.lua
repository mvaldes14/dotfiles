-- i3 muscle-memory overrides for Omarchy/Hyprland.
-- Required from ~/.config/hypr/hyprland.lua via require("hypr.i3-keybinds").

-- Vim-style focus movement (mirrors the SUPER+arrow focus binds).
-- Was: SUPER+J "Toggle window split", SUPER+K "Keybindings", SUPER+L "Toggle workspace layout".
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")
o.bind("SUPER + H", "Focus left window", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + J", "Focus below window", hl.dsp.focus({ direction = "d" }))
o.bind("SUPER + K", "Focus above window", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + L", "Focus right window", hl.dsp.focus({ direction = "r" }))

-- i3-style kill shortcuts, in addition to the default SUPER+W.
-- SUPER+Q is unbound by default; SUPER+SHIFT+Q matches i3's default.
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())
o.bind("SUPER + SHIFT + Q", "Close window", hl.dsp.window.close())

-- i3-style toggle floating (mirrors the SUPER+T binding).
-- Was: SUPER+SHIFT+SPACE "Toggle top bar".
hl.unbind("SUPER + SHIFT + SPACE")
o.bind("SUPER + SHIFT + SPACE", "Toggle window floating/tiling", hl.dsp.window.float({ action = "toggle" }))

-- i3-style "workspace back_and_forth": SUPER+TAB jumps to the previous
-- workspace instead of Omarchy's default (next workspace).
hl.unbind("SUPER + TAB")
o.bind("SUPER + TAB", "Former workspace", hl.dsp.focus({ workspace = "previous" }))
