return {
  "tpope/vim-dadbod",
  lazy = true,
  keys = {
    { "<leader>Da", "<cmd>DB<cr>", desc = "Connect to DB" },
  },
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
  },
}
