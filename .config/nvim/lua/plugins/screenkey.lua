return {
  "NStefan002/screenkey.nvim",
  cmd = "Screenkey",
  version = "*",
  lazy = false,
  config = function()
    require("screenkey").setup {
      win_opts = {
        row = 0,
        col = vim.o.columns,
        relative = "editor",
        anchor = "NE",
        width = 40,
        height = 3,
        border = "single",
        title = "Screenkey",
        title_pos = "center",
        style = "minimal",
        focusable = false,
        noautocmd = true,
        zindex = 90,
      },
    }
  end,
}
