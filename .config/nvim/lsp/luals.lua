return {
  settings = {
    Lua = {
      hint = {
        enable = true,
      },
      hover = {
        enable = true,
        expandAlias = true,
      },
      diagnostics = {
        globals = { "vim" },
      },
      format = {
        enable = true,
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
        maxPreload = 10000,
      },
    },
  },
}
