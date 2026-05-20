return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    focus = true,
    auto_close = true,
  },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                       desc = "Diagnostics (Workspace)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",          desc = "Diagnostics (Buffer)" },
    { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>",               desc = "Symbols" },
    { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP refs/defs" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                           desc = "Location List" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                            desc = "Quickfix List" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>",                              desc = "TODO Comments" },
  },
}
