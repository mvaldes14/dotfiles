return {
  "sudo-tee/opencode.nvim",
  event = "VeryLazy",
  config = function()
    require("opencode").setup {}
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
        file_types = { "markdown", "opencode_output" },
      },
      ft = { "markdown", "copilot-chat", "opencode_output" },
    },
  },
}
