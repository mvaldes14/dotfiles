return {
  "sourcegraph/sg.nvim",
  event = "InsertEnter",
  config = function()
    require("sg").setup()
  end,
}
