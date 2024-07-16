return {
  {
    "ramilito/kubectl.nvim",
    keys = {
      {
        "<leader>k",
        function()
          require("kubectl").open()
        end,
        group = "Utils",
        desc = "Kubectl",
      },
    },
  },
}
