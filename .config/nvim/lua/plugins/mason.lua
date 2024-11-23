return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    require("mason").setup()
    local utils = require "helper"
    local work_lsp = {
      "lua_ls",
      "terraformls",
      "gopls",
      "bashls",
      "ansiblels",
      "ts_ls",
      "yamlls",
      "jsonls",
      "solargraph",
      "rubocop",
      "ruby_lsp",
    }

    local home_lsp = {
      "rust_analyzer",
      "htmx",
      "pyright",
      -- "ruff_lsp",
      "marksman",
      "ltex",
      "astro",
      "tailwindcss",
      "templ",
      "harper_ls",
      "gopls",
      "solargraph",
    }

    local dap_adapters = {
      -- "python",
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
    local default_lsp = {}
    if utils.check_work() then
      default_lsp = work_lsp
    else
      default_lsp = home_lsp
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
  end
}
