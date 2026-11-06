-- ~/.config/rex/init.lua
-- Tmux/Herdr-inspired keymap.

------------------------------------------------------------
-- Tmux-like prefix: Ctrl-Space
------------------------------------------------------------

-- Send literal Ctrl-Space to terminal.
rex.bind("ctrl+space>ctrl+space", "pane.send_key", { key = "ctrl+space" })

-- Splits: match tmux muscle memory.
-- tmux: v = split-window -h = right split
-- tmux: h = split-window -v = down split
rex.bind("ctrl+space>v", "pane.split", { direction = "right" })
rex.bind("ctrl+space>ctrl+v", "pane.split", { direction = "right" })

rex.bind("ctrl+space>h", "pane.split", { direction = "down" })
rex.bind("ctrl+space>ctrl+h", "pane.split", { direction = "down" })

-- Close focused pane/block.
rex.bind("ctrl+space>w", "pane.close")
rex.bind("ctrl+space>ctrl+w", "pane.close")

-- New tab/window, closest Rex equivalent to tmux new-window.
rex.bind("ctrl+space>t", "client.tab.new")
rex.bind("ctrl+space>ctrl+t", "client.tab.new")

-- Tab/window navigation.
-- prefix+l = previous tab, matching herdr last_pane / tmux switch-client -l.
rex.bind("ctrl+space>l", "client.tab.previous")
rex.bind("ctrl+space>p", "client.tab.previous")
rex.bind("ctrl+space>tab", "client.tab.next")
rex.bind("ctrl+space>shift+tab", "client.tab.previous")

-- New session (herdr new_workspace / tmux new-session).
rex.bind("ctrl+space>n", "session.new")

-- Rename current tab/window and session (tmux: prefix + $).
rex.bind("ctrl+space>,", "client.tab.rename")
-- Rex spells `$` as Shift+4 in key sequences.
rex.bind("ctrl+space>shift+4", "session.rename")

-- Reload Rex config.
rex.bind("ctrl+space>ctrl+r", "client.config.reload")

-- Zoom focused pane.
rex.bind("ctrl+space>z", "pane.zoom")

-- Session switcher.
rex.bind("ctrl+space>s", "pane.go_to") -- new quick switcher (Settings > Developer > Experimental)

------------------------------------------------------------
-- Vim-aware pane navigation (vim-rex-navigator)
------------------------------------------------------------
-- Ctrl-h/j/k/l pass through to (n)vim when it's the foreground process;
-- nvim hands off back to Rex at split edges (see nvim lua/keymaps.lua).
-- Module comes from the lazy.nvim install; pcall keeps the rest of the config
-- loading if it's missing.
package.path = os.getenv("HOME")
  .. "/.local/share/nvim/lazy/vim-rex-navigator/rex/?.lua;"
  .. package.path

local ok, rexnav = pcall(require, "vim-rex-navigator")
if ok then
  rexnav.setup {
    focus_left = "ctrl+h",
    focus_down = "ctrl+j",
    focus_up = "ctrl+k",
    focus_right = "ctrl+l",
    move = false,
    resize = false,
    close = false,
  }
end

------------------------------------------------------------
-- Resize mode, similar to tmux C-M-h/j/k/l
------------------------------------------------------------

rex.mode("resize", { exclusive = true })

rex.bind("ctrl+space>r", "client.mode.enter", { name = "resize" })

rex.bind("resize/h", "pane.resize", { direction = "left", amount = 10 })
rex.bind("resize/j", "pane.resize", { direction = "down", amount = 10 })
rex.bind("resize/k", "pane.resize", { direction = "up", amount = 10 })
rex.bind("resize/l", "pane.resize", { direction = "right", amount = 10 })

rex.bind("resize/left", "pane.resize", { direction = "left", amount = 10 })
rex.bind("resize/down", "pane.resize", { direction = "down", amount = 10 })
rex.bind("resize/up", "pane.resize", { direction = "up", amount = 10 })
rex.bind("resize/right", "pane.resize", { direction = "right", amount = 10 })

rex.bind("resize/=", "pane.balance")
rex.bind("resize/enter", "client.mode.exit")
rex.bind("resize/escape", "client.mode.exit")
