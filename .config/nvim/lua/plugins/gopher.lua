return {
  "olexsmir/gopher.nvim",
  ft = "go",
  build = function()
    vim.cmd [[ !silent GoInstallDeps  ]]
  end,
  keys = {
    { "<leader>gaj", "<cmd>GoTagAdd json<cr>", desc = "Go Add Tags Json" },
    { "<leader>gat", "<cmd>GoTestAll<cr>", desc = "Go Add Tests" },
    { "<leader>gae", "<cmd>GoIfErr<cr>", desc = "Go IfErr" },
  },
}
