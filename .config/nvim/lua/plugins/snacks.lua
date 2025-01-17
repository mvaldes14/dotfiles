return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    quickfile = {
      enabled = true,
    },
    scroll = {
      enabled = true,
    },
    input = {
      enabled = true,
    },
    notifier = {
      enabled = true,
    },
    bigfile = {
      enabled = true,
    },
    picker = {
      enabled = true,
    },
    dashboard = {
      sections = {
        { section = "header", padding = 3 },
        { icon = " ", title = "Keymaps", section = "keys", padding = 1 },
        {
          section = "recent_files",
          icon = " ",
          title = "Recent Files",
          padding = 3,
        },
        {
          section = "startup",
        },
      },
      preset = {
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          {
            icon = " ",
            key = "f",
            desc = "Find File",
            action = function()
              Snacks.picker.files { hidden = true }
            end,
          },
          {
            icon = " ",
            key = "g",
            desc = "Find Text",
            action = function()
              Snacks.picker.grep { hidden = true }
            end,
          },
          {
            icon = " ",
            key = "r",
            desc = "Recent Files",
            action = function()
              Snacks.picker.recent()
            end,
          },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
                                                   
            ████ ██████           █████      ██                 btw
           ███████████             █████ 
           █████████ ███████████████████ ███   ███████████
          █████████  ███    █████████████ █████ ██████████████
         █████████ ██████████ █████████ █████ █████ ████ █████
       ███████████ ███    ███ █████████ █████ █████ ████ █████
      ██████  █████████████████████ ████ █████ █████ ████ ██████
      ]],
      },
    },
  },
}
