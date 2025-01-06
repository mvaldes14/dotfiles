return {
  -- {
  --   dir = "~/git/terraform.nvim/",
  --   ft = "terraform",
  -- },
  {
    dir = "~/git/linear.nvim",
    cond = function()
      return not require("helper").check_work()
    end,
  },
  {
    dir = "~/git/todoist.nvim",
    cond = function()
      return not require("helper").check_work()
    end,
    config = function()
      require("todoist").setup {}
    end,
  },
}
