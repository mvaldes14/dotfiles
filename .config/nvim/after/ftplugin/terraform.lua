vim.api.nvim_create_autocmd("BufWrite", {
  nested = true,
  callback = function()
    print("Validating Terraform")
    require("terraform").validate()
  end,
})
