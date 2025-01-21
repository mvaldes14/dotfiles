return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      enabled = true,
    },
    scroll = {
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
      enabled = true,
      sections = {
        { section = "header", padding = 3 },
        { icon = " ", title = "Keymaps", section = "keys", padding = 1, indent = 1 },
        {
          section = "recent_files",
          icon = " ",
          title = "Recent Files",
          padding = 3,
          indent = 1,
        },
        {
          section = "terminal",
          cmd = "git --no-pager diff --stat -B -C -M",
          icon = " ",
          title = "Git Status",
          padding = 1,
          enabled = vim.fn.isdirectory ".git" == 1,
          ttl = 10,
          indent = 1,
        },
        {
          section = "startup",
        },
      },
      preset = {
        pick = "telescope.nvim",
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          {
            icon = " ",
            key = "f",
            desc = "Find File",
            action = function()
              Snacks.picker.files({ hidden = true })
            end,
          },
          {
            icon = " ",
            key = "g",
            desc = "Find Text",
            action = function()
              Snacks.picker.grep({ hidden = true })
            end,
          },
          {
            icon = " ",
            key = "B",
            desc = "Browse Repo",
            action = function()
              Snacks.gitbrowse()
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
