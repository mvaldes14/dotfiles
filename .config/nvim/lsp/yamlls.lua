return {
  settings = {
    yaml = {
      format = {
        enable = true,
        singleQuote = true,
      },
      validate = true,
      hover = true,
      completion = true,
      schemaStore = {
        url = "",
        enable = false,
      },
      schemas = require("schemastore").yaml.schemas(),
      customTags = {
        "!fn",
        "!And",
        "!If",
        "!Not",
        "!Equals",
        "!Or",
        "!FindInMap sequence",
        "!Base64",
        "!Cidr",
        "!Ref",
        "!Ref Scalar",
        "!Sub",
        "!GetAtt",
        "!GetAZs",
        "!ImportValue",
        "!Select",
        "!Split",
        "!Join sequence",
      },
    },
  },
}
