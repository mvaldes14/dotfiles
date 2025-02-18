return {
  -- LSP Configuration & Plugins "neovim/nvim-lspconfig",
  "neovim/nvim-lspconfig",
  event = "BufEnter",
  dependencies = {
    "folke/neodev.nvim",
  },
  config = function()
    local lspconfig = require "lspconfig"
    require("neodev").setup {}
    lspconfig.htmx.setup {
      cmd = { "test" },
      filetypes = { "astro", "html", "vue", "django-html", "htmldjango", "gohtml", "templ" },
    }

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    lspconfig.templ.setup { capabilities = capabilities }
    lspconfig.rust_analyzer.setup { capabilities = capabilities }
    lspconfig.terraformls.setup { capabilities = capabilities }
    lspconfig.nixd.setup {
      capabilities = capabilities,
      settings = {
        nixd = {
          formatting = {
            command = { "alejandra " },
          },
          options = {
            nixos = {
              expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.nixos.options',
            },
            home_manager = {
              expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations.nixos.options',
            },
          },
        },
      },
    }
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
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
    lspconfig.yamlls.setup {
      capabilities = capabilities,
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

    lspconfig.jsonls.setup {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }

    lspconfig.ltex.setup {
      capabilities = capabilities,
      settings = {
        ltex = {
          checkFrequency = "save",
        },
      },
    }

    lspconfig.marksman.setup {}

    lspconfig.gopls.setup {
      capabilities = capabilities,
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

    lspconfig.ts_ls.setup {
      capabilities = capabilities,
      settings = {
        javascript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          },
        },
        typescript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
          },
        },
      },
    }

    -- For the blog
    lspconfig.tailwindcss.setup {
      filetypes = { " astro", "html", "css", "javascript", "typescript", "templ", "vue" },
    }
    lspconfig.astro.setup {}
    lspconfig.pyright.setup {}
  end,
}
