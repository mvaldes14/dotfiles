return {
  "tpope/vim-dadbod",
  event = "VeryLazy",
  keys = {
    { "<leader>xc", "<cmd>DB<cr>", desc = "Connect to DB" },
    { "<leader>xd", "<cmd>DBUIToggle<cr>", desc = "DB Toggle UI" },
  },
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
}
