return {
  "tpope/vim-dadbod",
  event = "VeryLazy",
  keys = {
    { "<leader>Da", "<cmd>DB<cr>", desc = "Connect to DB" },
  },
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
}
