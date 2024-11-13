return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    {
      "<leader>sH",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Show Notification History",
    },
    {
      "<leader>bc",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
  },
}
