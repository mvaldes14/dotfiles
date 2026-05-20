return {
  -- LOCAL NEOVIM PLUGIN DEV
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        "lazy.nvim",
        "nvim-dap-ui",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      latex = {
        enabled = false,
      },
    },
  },
}
