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
      timeout = 3000,
    },
    bigfile = {
      enabled = true,
      size = 1.0 * 1024 * 1024,
      notify = true,
    },
    picker = {
      enabled = true,
      ui_select = true,
      cwd = true,
    },
    dashboard = {
      sections = {
        { section = "header", padding = 3 },
        { section = "recent_files", icon = " ", title = "Recent Files", padding = 3 },
        { section = "keys", padding = 3, limit = 5 },
        {
          section = "startup",
        },
        -- {
        --   section = "terminal",
        --   icon = " ",
        --   title = "Git Status",
        --   enabled = vim.fn.isdirectory ".git" == 1,
        --   cmd = "curl -s 'wttr.in/?0'",
        --   height = 8,
        --   padding = 2,
        --   indent = 0,
        -- },
      },
      preset = {
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
