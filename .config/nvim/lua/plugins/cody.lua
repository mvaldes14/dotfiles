return {
  "sourcegraph/sg.nvim",
  event = "InsertEnter",
  cond = function()
    local validation = require "helper"
    return validation.check_work()
  end,
  config = function()
    require("sg").setup()
  end,
}
