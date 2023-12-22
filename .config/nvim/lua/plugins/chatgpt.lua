return {
  "jackMort/ChatGPT.nvim",
  keys = {
    { "<leader>gg", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
  },
  config = function()
    require("chatgpt").setup {}
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
