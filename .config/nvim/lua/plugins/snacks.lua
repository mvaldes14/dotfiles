return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    bifile = {
      enabled = true,
      size = 1.0 * 1024 * 1024,
      notify = true,
    },
  },
}
