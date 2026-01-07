vim.filetype.add {
  extension = {
    mdx = "markdown",
    http = "http",
    erb = "ruby",
    templ = "templ",
    cue = "cue",
  },
  pattern = {
    [".env"] = "sh",
    [".conf"] = "sh",
  },
  filename = {
    ["justfile"] = "make",
  },
}

-- Set commentstring for Cue files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cue",
  callback = function()
    vim.opt_local.commentstring = "// %s"
  end
})
