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
      require("todoist").setup {
        token_api = "",
        default_filter = "all",
        filters = {
          all = "all",
          today = "due:today",
          no_recurring = "!recurring",
          no_date = "no date",
          pending = "@review",
        },
      }
    end,
  },
}
