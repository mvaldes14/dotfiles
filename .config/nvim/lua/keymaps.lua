local opts = { noremap = true, silent = true }

-- Core
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.keymap.set({ "n" }, "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set({ "n" }, "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })
vim.keymap.set({ "n" }, "<leader>m", "<cmd>Noice<cr>", { desc = "Messages" })
vim.keymap.set({ "n" }, "<leader>i", "<cmd>nohlsearch<cr>", { desc = "Highlight Off", silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>:", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })
vim.keymap.set({ "n" }, "<leader>Hh", function()
  Snacks.picker.help()
end, { desc = "Help" })
vim.keymap.set({ "n" }, "<leader>Hk", function()
  Snacks.picker.keymaps()
end, { desc = "Keymaps" })
vim.keymap.set({ "n" }, "<leader>ba", function()
  Snacks.bufdelete.other()
end, { desc = "[B]uffer Close all But Current" })
vim.keymap.set("n", "<C-s>", "<Esc>:w<CR>", { desc = "Save File" })
vim.keymap.set("n", "<C-q>", "<Esc>:q<CR>", { desc = "Quit File" })
vim.keymap.set("c", "Q", "<cmd>qa!<cr>", { desc = "Quit" })
vim.keymap.set({ "n" }, "<leader>sH", function()
  Snacks.notifier.show_history()
end, { desc = "Show Notification History" })
vim.keymap.set({ "n" }, "<leader>bc", function()
  Snacks.bufdelete()
end, { desc = "[B]uffer Delete " })
vim.keymap.set({ "n" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set("n", "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })
-- Copy and Paste with the system clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })

-- Navigation
vim.keymap.set({ "n" }, "<leader>E", "<cmd>Oil --float <cr>", { desc = "Oil Float" })
-- <C-hjkl> for window/tmux nav is handled by nvim-tmux-navigation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- Smooth Scrolling at the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Git
vim.keymap.set({ "n" }, "<leader>g?", "<cmd>Git<cr>", { desc = "Git" })
vim.keymap.set({ "n" }, "<leader>G", function()
  Snacks.lazygit()
end, { desc = "LazyGit" })
vim.keymap.set(
  { "n" },
  "<leader>gbl",
  "<cmd>Gitsigns toggle_current_line_blame<cr>",
  { desc = "[Git] Toggle Blame Line" }
)
vim.keymap.set({ "n" }, "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<cr>", { desc = "[Git] Preview Hunk Inline" })
vim.keymap.set({ "n" }, "[c", "<cmd>Gitsigns prev_hunk<cr>", { desc = "[Git] Previous Hunk" })
vim.keymap.set({ "n" }, "]c", "<cmd>Gitsigns next_hunk<cr>", { desc = "[Git] Next Hunk" })

-- Random
vim.keymap.set({ "n" }, "<leader>Z", function()
  Snacks.zen()
end, { desc = "Zen Mode" })
vim.keymap.set({ "n", "v" }, "<leader>Xx", "<cmd>lua require('kulala').run()<cr>", { desc = "Execute Request" })
vim.keymap.set({ "n" }, "<leader>Xc", "<cmd>DB<cr>", { desc = "Connect to DB" })
vim.keymap.set({ "n" }, "<leader>Xd", "<cmd>DBUIToggle<cr>", { desc = "DB Toggle UI" })

--Snacks
vim.keymap.set({ "n" }, "<leader>?", function()
  Snacks.picker.recent()
end, { desc = "[?] Find recently opened files" })
vim.keymap.set({ "n" }, "<leader><space>", function()
  Snacks.picker()
end, { desc = "[S]how pickers " })
vim.keymap.set({ "n" }, "<leader>sf", function()
  Snacks.picker.files()
end, { desc = "[S]earch [F]iles" })
vim.keymap.set({ "n" }, "<leader>ss", function()
  Snacks.picker.smart()
end, { desc = "[S]earch [S]mart" })
vim.keymap.set({ "n", "v" }, "<leader>sw", function()
  Snacks.picker.grep_word()
end, { desc = "[S]earch current [W]ord" })
vim.keymap.set({ "n" }, "<leader>sg", function()
  Snacks.picker.grep { hidden = true }
end, { desc = "[S]earch by [G]rep" })
vim.keymap.set({ "n" }, "<leader>sd", function()
  Snacks.picker.diagnostics()
end, { desc = "[S]how Diagnostics" })

-- DAP
vim.keymap.set("n", "<F1>", "<cmd> lua require('dap').step_back()<cr>", { desc = "Debugger Step Back" })
vim.keymap.set("n", "<F2>", "<cmd> lua require('dap').step_into()<cr>", { desc = "Debug Into" })
vim.keymap.set("n", "<F3>", "<cmd> lua require('dap').step_over()<cr>", { desc = "Debug Step Over" })
vim.keymap.set("n", "<F4>", "<cmd> lua require('dap').step_out()<cr>", { desc = "Debug Step Out" })
vim.keymap.set("n", "<F5>", "<cmd> lua require('dap').continue()<cr>", { desc = "Debug Continue" })
-- <leader>d* debug maps are registered on session start in plugins/dap.lua

-- AI
vim.keymap.set({ "n" }, "<leader>co", "<cmd>ClaudeCode<cr>", { desc = "Claude Code Open" })
vim.keymap.set({ "v" }, "<leader>cs", "<cmd>ClaudeCodeSend<cr>", { desc = "Claude Code Send" })

-- YAML
vim.keymap.set("n", "<leader>F", function()
  if vim.bo.filetype ~= "yaml" and vim.bo.filetype ~= "yml" then
    vim.notify("Not a yaml buffer", vim.log.levels.WARN)
    return
  end

  local bufnr = vim.api.nvim_get_current_buf()
  local client = vim.lsp.get_clients({ bufnr = bufnr, name = "yamlls" })[1]
  if not client then
    vim.notify("yamlls not attached", vim.log.levels.WARN)
    return
  end

  client.settings.yaml.format.enable = true
  client:notify("workspace/didChangeConfiguration", { settings = client.settings })
  vim.lsp.buf.format {
    bufnr = bufnr,
    filter = function(c)
      return c.name == "yamlls"
    end,
  }
  client.settings.yaml.format.enable = false
  client:notify("workspace/didChangeConfiguration", { settings = client.settings })
end, { desc = "Format current buffer with yamlls" })
