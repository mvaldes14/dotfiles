vim.opt_local.wrap = true
vim.opt_local.conceallevel = 1
vim.opt_local.spell = true

if string.match(vim.fn.getcwd(), "wiki") then
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("obsidian_check", { clear = true }),
    pattern = "*.md",
    desc = "Check on save",
    callback = function()
      vim.cmd "Obsidian check"
    end,
  })
end
