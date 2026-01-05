return {
  -- LOCAL NEOVIM PLUGIN DEV
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        "lazy.nvim",
        "nvim-dap-ui"
      },
    },
  },
  -- {
  --   dir = "~/git/terraform.nvim/",
  --   ft = "terraform",
  --   cond = function()
  --     return not require("helper").check_work()
  --   end,
  -- },
  -- {
  --   dir = "~/git/linear.nvim",
  --   cond = function()
  --     return not require("helper").check_work()
  --   end,
  -- },
  -- {
  --   dir = "~/git/todoist.nvim",
  --   cond = function()
  --     return not require("helper").check_work()
  --   end,
  --   opts = {
  --     token_api = "",
  --     default_filter = "all",
  --     here = "mate",
  --     filters = {
  --       all = "all",
  --       today = "due:today",
  --       no_recurring = "!recurring",
  --       no_date = "no date",
  --       pending = "@review",
  --     },
  --   },
  -- },
}
