return {
  "mistweaverco/kulala.nvim",
  ft = "http",
  config = function()
    require("kulala").setup()
  end,
  keys = {
    { "<leader>xx", "<cmd>require('kuala').run()<cr>", desc = "Execute Request", mode = "n" },
  },
}
