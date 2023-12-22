return {
  "mhartington/formatter.nvim",
  config = function()
    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require("formatter").setup {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        python = {
          require("formatter.filetypes.python").black,
        },
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        ansible = {
          require("formatter.filetypes.yaml").yamlfmt,
        },
        terraform = {
          require("formatter.filetypes.terraform").terraformfmt,
        },
        json = {
          require("formatter.filetypes.json").jq,
        },
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },
        html = {
          require("formatter.filetypes.html").prettier,
        },
        go = {
          require("formatter.filetypes.go").gofmt,
        },
        ruby = {
          require("formatter.filetypes.ruby").rubocop,
        },
        yaml = {
          require("formatter.filetypes.yaml").yamlfmt,
        },
        chef = {
          require("formatter.filetypes.ruby").rubocop,
        },
        sh = {
          require("formatter.filetypes.sh").shfmt,
        },
        nix = {
          require("formatter.filetypes.nix").nixpkgs_fmt,
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    }
  end,
}
