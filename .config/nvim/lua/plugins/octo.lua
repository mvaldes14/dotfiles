return {
  "pwntester/octo.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>gr", "<cmd>Octo pr list<cr>", desc = "Octo" },
  },
  config = function()
    require("octo").setup {
      suppress_missing_scope = {
        projects_v2 = true,
      },
    }
  end,
}
