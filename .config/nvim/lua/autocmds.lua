-- Autocmds
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  desc = "Highlight selection on yank",
  callback = function()
    vim.hl.on_yank { timeout = 200, visual = true }
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("vertical_help", { clear = true }),
  pattern = "help",
  callback = function()
    vim.bo.bufhidden = "unload"
    vim.cmd.wincmd "L"
    vim.cmd.wincmd "="
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.tf" },
  callback = function()
    vim.cmd "TerraformValidate"
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(ev)
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc, silent = true })
    end
    map("gd", vim.lsp.buf.definition,                            "LSP: [G]oto [D]efinition")
    map("gI", vim.lsp.buf.implementation,                        "LSP: [G]oto [I]mplementation")
    map("gr", function() Snacks.picker.lsp_references() end,     "LSP: [G]oto [R]eferences")
    map("K",  vim.lsp.buf.hover,                                 "LSP: Hover Documentation")
    map("<leader>D",  vim.lsp.buf.type_definition,               "LSP: Type [D]efinition")
    map("<leader>ds", function() Snacks.picker.lsp_symbols() end, "LSP: [D]ocument [S]ymbols")
    map("<leader>rn", vim.lsp.buf.rename,                        "LSP: [R]ename")
    map("<leader>ca", vim.lsp.buf.code_action,                   "LSP: [C]ode [A]ction")
    map("<leader>e",  vim.diagnostic.open_float,                 "LSP: Show diagnostic [E]rror")
    map("<leader>sh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, "LSP: [S]how Inlay [H]ints")
  end,
})

