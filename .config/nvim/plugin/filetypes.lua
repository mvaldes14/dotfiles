vim.filetype.add {
  extension = {
    mdx = "markdown",
    http = "http",
    erb = "ruby"
  },
  pattern = {
    ['.env'] = 'sh',
    ['.conf'] = 'sh',
  },
  filename = {
    ['justfile'] = 'make'
  }
}
