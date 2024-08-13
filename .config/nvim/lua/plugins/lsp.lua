return {
  -- LSP Configuration & Plugins "neovim/nvim-lspconfig",
  "neovim/nvim-lspconfig",
  event = "BufEnter",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "WhoIsSethDaniel/mason-tool-installer",
  },
  config = function()
    -- Setup mason so it can manage external tooling
    require("mason").setup()
    local work_lsp = {
      "lua_ls",
      "terraformls",
      "gopls",
      "bashls",
      "ansiblels",
      "tsserver",
      "yamlls",
      "jsonls",
      "solargraph",
    }

    local home_lsp = {
      "rust_analyzer",
      "htmx",
      "nil_ls",
      "pyright",
      "ruff_lsp",
      "solargraph",
      "marksman",
      "ltex",
      "astro",
      -- "tailwindcss",
      "templ",
    }

    local dap_adapters = {
      "python",
      "js",
      "bash",
    }

    local tools = {
      "stylua",
      "black",
      "prettier",
      "stylua",
      "yamlfmt",
      "revive",
      "pylint",
      "ansible-lint",
      "luacheck",
      "cfn-lint",
      "tfsec",
      "rubocop",
      "revive",
      "yamllint",
    }

    local hostname = vim.fn.hostname()
    local default_lsp = {}
    if hostname == "MACG7YVXHYFWG" then
      default_lsp = work_lsp
    else
      -- Merge tables for home setup
      for _, lsp in ipairs(home_lsp) do
        table.insert(default_lsp, lsp)
      end
    end

    require("mason-tool-installer").setup {
      ensure_installed = tools,
      run_on_start = false,
    }

    require("mason-nvim-dap").setup {
      ensure_installed = dap_adapters,
      automatic_installation = false,
    }

    -- Ensure the servers above are installed
    require("mason-lspconfig").setup {
      ensure_installed = default_lsp,
      automatic_installation = false,
    }

    -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- LSP settings.
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
      nmap("]d", vim.diagnostic.goto_next, "Next diagnostic")
      nmap("<leader>e", vim.diagnostic.open_float, "Show diagnostic [E]rror messages")

      nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
      nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
      nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
      nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

      -- See `:help K` for why this keymap
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<leader>F", vim.cmd.Format, "Format Document")
      nmap("<A-k>", vim.lsp.buf.signature_help, "Signature Documentation")
    end

    for _, lsp in ipairs(default_lsp) do
      require("lspconfig")[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end

    -- Make runtime files discoverable to the server
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    -- Specific LSP settings
    require("neodev").setup {}
    require("lspconfig").templ.setup {}

    require("lspconfig").htmx.setup {}
    require("lspconfig").nil_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["nil"] = {
          formatting = {
            command = { "nixpkgs-fmt" },
          },
        },
      },
    }

    require("lspconfig").lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          hint = {
            enable = true,
          },
          runtime = {
            version = "LuaJIT",
            path = runtime_path,
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
            maxPreload = 10000,
          },
          telemetry = { enable = false },
        },
      },
    }

    require("lspconfig").yamlls.setup {
      on_attach = on_attach,
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
            url = "https://www.schemastore.org/api/json/catalog.json",
            enable = true,
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

    require("lspconfig").jsonls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }

    require("lspconfig").ltex.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ltex = {
          checkFrequency = "save",
        },
      },
    }

    require("lspconfig").gopls.setup {
      on_attach = on_attach,
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

    require("lspconfig").tsserver.setup {
      on_attach = on_attach,
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
  end,
}
