return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      mux = {
        backend = "tmux",
        enabled = true,
      },
    },
  },
  keys = {
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle { focus = true }
      end,
      desc = "Sidekick Toggle CLI",
      mode = { "n", "v" },
    },
  },
}
