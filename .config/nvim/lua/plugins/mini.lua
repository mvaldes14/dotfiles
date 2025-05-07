return {
  "echasnovski/mini.nvim",
  dependencies = {
    "MeanderingProgrammer/render-markdown.nvim",
  },
  config = function()
    require("mini.ai").setup {}
    require("mini.surround").setup()
    require("mini.pairs").setup()
    require("mini.comment").setup {}
  end,
}
