return {
  "jackMort/ChatGPT.nvim",
  keys = {
    { "<leader>gg", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
    { "<leader>aa", "<cmd>ChatGptActAs<cr>", desc = "Act As" },
    { "<leader>ag", "<cmd>ChatGptRun grammar_correction<cr>", desc = "Grammar Correction" },
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
