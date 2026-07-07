return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost" },
  config = function()
    require("lint").linters_by_ft = {
      python = { "ruff" },
      ansible = { "ansible_lint" },
      lua = { "luacheck" },
      terraform = { "tflint" },
      go = { "golangcilint" },
      yaml = { "yamllint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        if require("lint").linters_by_ft[vim.bo.filetype] then
          require("lint").try_lint()
        end
      end,
    })
  end,
}
