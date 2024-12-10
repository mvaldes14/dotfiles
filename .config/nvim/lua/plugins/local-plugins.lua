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
}
