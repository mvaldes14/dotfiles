return {
  {
    "vhyrro/luarocks.nvim",
    ft = "http",
    config = function()
      require("luarocks").setup {}
    end,
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup {}
    end,
  },
}
