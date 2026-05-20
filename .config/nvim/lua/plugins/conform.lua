return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        ansible = {
          "yamlfmt",
        },
        terraform = {
          "terraform_fmt",
        },
        json = {
          "jq",
        },
        javascript = {
          "prettier",
          "prettierd",
        },
        typescript = {
          "prettier",
          "prettierd",
        },
        html = {
          "prettier",
          "prettierd",
        },
        go = {
          "goimports",
          "gofumpt",
        },
        templ = {
          "templ",
        },
        sh = {
          "shfmt",
        },
        python = {
          "ruff",
        },
        lua = {
          "stylua",
        },
        bash = {
          "shfmt",
        },
        jsonnet = {
          "jsonnetfmt",
        },
        cue = {
          "cue_fmt",
        },
      },
    }
  end,
}
