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
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    bigfile = {
      enabled = true,
      size = 1.0 * 1024 * 1024,
      notify = true,
    },
  },
}
