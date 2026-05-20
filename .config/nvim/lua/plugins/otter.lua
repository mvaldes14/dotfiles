return {
  "jmbuhr/otter.nvim",
  ft = "markdown",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("otter").setup {}
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function(ev)
        -- Defer + pcall: otter walks treesitter nodes on activation; if the
        -- parser hasn't built a tree yet (e.g. empty buffer), node:range()
        -- fails. Defer to next tick and swallow errors silently.
        vim.schedule(function()
          if not vim.api.nvim_buf_is_valid(ev.buf) then
            return
          end
          pcall(function()
            require("otter").activate { "go", "python", "lua", "bash", "yaml", "json" }
          end)
        end)
      end,
    })
  end,
}
