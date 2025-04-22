return {
  cmd = { "gopls" },
  root_markers = { "go.mod", ".git" },
  filetypes = { "go" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        unreachable = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameteres = true,
        parameterNames = true,
      },
    },
  },
}
