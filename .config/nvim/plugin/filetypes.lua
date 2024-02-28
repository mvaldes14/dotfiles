vim.filetype.add {
  extension = {
    mdx = "markdown",
    http = "http",
    erb = "ruby",
    templ = "templ",
  },
  pattern = {
    [".env"] = "sh",
    [".conf"] = "sh",
  },
  filename = {
    ["justfile"] = "make",
  },
}
