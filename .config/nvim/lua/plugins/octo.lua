return {
  "pwntester/octo.nvim",
  requires = {
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Octo",
  config = function()
    require("octo").setup {
      suppress_missing_scope = {
        projects_v2 = true,
      },
    }
  end,
}
