return {
  "sourcegraph/sg.nvim",
  event = "InsertEnter",
  cond = function()
    return not require("helper").check_work()
  end,
}
