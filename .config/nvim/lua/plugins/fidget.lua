return {
  "j-hui/fidget.nvim",
  config = function()
    -- LSP Status spinner
    require("fidget").setup {
      progress = {
        ignore = {
          "lua_ls",
        },
      },
      notification = {
        window = {
          winblend = 0,
          border = "none",
        },
      },
    }
  end,
}
