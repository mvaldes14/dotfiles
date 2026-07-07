-- On nix systems packages are managed by nix/home-manager, so mason is disabled entirely.
local is_nix = vim.fn.isdirectory("/nix/store") == 1

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer",
        "jay-babu/mason-nvim-dap.nvim",
    },
    event = "VeryLazy",
    cond = not is_nix,
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
            "helm_ls",
            "pyright",
            "jsonnet_ls",
            "templ",
            "marksman",
        }

        local dap_adapters = {
            "python",
            "js",
            "bash",
            "delve"
        }

        local tools = {
            -- lua
            "stylua",
            "luacheck",
            -- go
            "gofumpt",
            "goimports",
            "golangci-lint",
            "gotests",
            "iferr",
            "impl",
            "gomodifytags",
            "delve",
            -- python
            "ruff",
            -- web / json
            "prettier",
            "prettierd",
            "jq",
            -- yaml / ansible
            "yamlfmt",
            "yamllint",
            "ansible-lint",
            -- terraform
            "tflint",
            -- shell
            "shfmt",
        }
        require("mason-tool-installer").setup {
            ensure_installed = tools,
            run_on_start = true,
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
