return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer",
    "jay-babu/mason-nvim-dap.nvim",
  },
  event = "VeryLazy",
  -- NOTE: Mason at work only, rest is nix
  cond = function()
    return require("helper").check_work()
  end,
  config = function()
    require("mason").setup()
    local work_lsp = {
      "lua_ls",
      "terraformls",
      "gopls",
      "bashls",
      "ansiblels",
      "ts_ls",
      "yamlls",
      "jsonls",
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
      "yamlfmt",
      "revive",
      "pylint",
      "ansible-lint",
      "luacheck",
      "cfn-lint",
      "tfsec",
      "revive",
      "yamllint",
    }
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
      ensure_installed = work_lsp,
      automatic_installation = false,
    }
  end,
}
