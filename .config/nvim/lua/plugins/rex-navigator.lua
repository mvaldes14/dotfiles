-- Seamless Ctrl-h/j/k/l between Neovim splits and Rex panes.
-- Keymaps live in lua/keymaps.lua (nav()); this only provides the module it calls.
-- Rex side: ~/.config/rex/init.lua loads rex/vim-rex-navigator.lua from this plugin's lazy dir.
return {
  "pankrashin/vim-rex-navigator",
  main = "vim-rex-navigator",
  lazy = true,
  opts = { focus = false, move = false, resize = false, close = false },
}
