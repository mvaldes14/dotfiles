return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = false,
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
          "prettierd",
          "prettier",
          stop_after_first = true,
        },
        typescript = {
          "prettierd",
          "prettier",
          stop_after_first = true,
        },
        html = {
          "prettierd",
          "prettier",
          stop_after_first = true,
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
        yaml = {},
      },
    }
  end,
}
