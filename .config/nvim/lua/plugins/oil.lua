return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    columns = { "icon" },
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    { "<leader>E", "<cmd>Oil<cr>", desc = "Oil" },
    { "<leader>_", "<cmd>Oil --float <cr>", desc = "Oil Float" },
  },
}
