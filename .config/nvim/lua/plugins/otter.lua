return {
  "jmbuhr/otter.nvim",
  ft = "markdown",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("otter").setup {}
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function(ev)
        vim.defer_fn(function()
          if not vim.api.nvim_buf_is_valid(ev.buf) then
            return
          end
          local ok_p, parser = pcall(vim.treesitter.get_parser, ev.buf, "markdown")
          if not ok_p or not parser then
            return
          end
          pcall(function()
            parser:parse(true)
          end)
          pcall(function()
            require("otter").activate { "go", "python", "lua", "bash", "yaml", "json" }
          end)
        end, 50)
      end,
    })
  end,
}
