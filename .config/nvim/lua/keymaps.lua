local opts = { noremap = true, silent = true }

-- Core
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set({ "n" }, "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set({ "n" }, "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })
vim.keymap.set({ "n" }, "<leader>i", "<cmd>nohlsearch<cr>", { desc = "Highlight Off", silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>hh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
vim.keymap.set({ "n" }, "<leader>hk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
vim.keymap.set({ "n" }, "<leader>ba", "<cmd>BufferLineCloseOthers<cr>", { desc = "[B]uffer Close all But Current" })
vim.keymap.set("n", "<C-s>", "<Esc>:w<CR>", opts)
vim.keymap.set("n", "<C-q>", "<Esc>:q<CR>", opts)
vim.keymap.set("c", "Q", "<cmd>qa!<cr>", opts)
vim.keymap.set({ "n" }, "<leader>sH", function()
  Snacks.notifier.show_history()
end, { desc = "Show Notification History" })
vim.keymap.set({ "n" }, "<leader>bc", function()
  Snacks.bufdelete()
end, { desc = "[B]uffer Delete " })
vim.keymap.set({ "n" }, "s", function()
  require("flash").jump { search = {
    mode = function(str)
      return "\\<" .. str
    end,
  } }
end, { desc = "Flash" })

vim.keymap.set("n", "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })
-- Copy and Paste without system clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
vim.keymap.set(
  { "n", "v", "x" },
  "<leader>Y",
  '"+yy',
  { noremap = true, silent = true, desc = "Yank line to clipboard" }
)
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })

-- Navigation
vim.keymap.set({ "n" }, "<leader>E", "<cmd>Oil --float <cr>", { desc = "Oil Float" })
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
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
vim.keymap.set({ "n" }, "<leader>gr", "<cmd>Octo pr list<cr>", { desc = "[Git] Octo" })
vim.keymap.set({ "n" }, "[c", "<cmd>Gitsigns prev_hunk<cr>", { desc = "[Git] Previous Hunk" })
vim.keymap.set({ "n" }, "]c", "<cmd>Gitsigns next_hunk<cr>", { desc = "[Git] Next Hunk" })
vim.keymap.set({ "n" }, "<leader>gb", "<cmd>Gitsigns blame<cr>", { desc = "[Git] Next Hunk" })
vim.keymap.set({ "n" }, "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "[Git] Preview Hunk" })

-- Random
vim.keymap.set({ "n" }, "<leader>Z", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })
vim.keymap.set({ "n" }, "<leader>tt", "<cmd>ToggleTodo<cr>", { desc = "[T]oggle Todo" })
vim.keymap.set({ "n" }, "<leader>xx", "<cmd>lua require('kulala').run()<cr>", { desc = "Execute Request" })
vim.keymap.set({ "n" }, "<leader>xc", "<cmd>DB<cr>", { desc = "Connect to DB" })
vim.keymap.set({ "n" }, "<leader>xd", "<cmd>DBUIToggle<cr>", { desc = "DB Toggle UI" })

-- LSP
vim.keymap.set(
  { "n" },
  "<leader>sh",
  "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
  { desc = "[S]how Inlay Hints" }
)
vim.keymap.set({ "n" }, "<leader>rn", vim.lsp.buf.rename, { desc = "LSP:[R]ename" })
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP:[C]ode [A]ction" })
vim.keymap.set({ "n" }, "[d", vim.diagnostic.goto_prev, { desc = "LSP:Previous diagnostic" })
vim.keymap.set({ "n" }, "]d", vim.diagnostic.goto_next, { desc = "LSP:Next diagnostic" })
vim.keymap.set({ "n" }, "<leader>e", vim.diagnostic.open_float, { desc = "LSP:Show diagnostic [E]rror messages" })
vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition, { desc = "LSP:[G]oto [D]efinition" })
vim.keymap.set({ "n" }, "gr", 'require("telescope.builtin").lsp_references', { desc = "LSP:[G]oto [R]eferences" })
vim.keymap.set({ "n" }, "gI", vim.lsp.buf.implementation, { desc = "LSP:[G]oto [I]mplementation" })
vim.keymap.set({ "n" }, "<leader>D", vim.lsp.buf.type_definition, { desc = "LSP:Type [D]efinition" })
vim.keymap.set(
  { "n" },
  "<leader>ds",
  'require("telescope.builtin").lsp_document_symbols',
  { desc = "LSP: [D]ocument [S]ymbols" }
)
vim.keymap.set(
  { "n" },
  "<leader>ws",
  'require("telescope.builtin").lsp_dynamic_workspace_symbols',
  { desc = "LSP: [W]orkspace [S]ymbols" }
)
vim.keymap.set({ "n" }, "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set({ "n" }, "<leader>F", vim.cmd.Format, { desc = "Format Document" })
vim.keymap.set({ "n" }, "<A-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

-- AI
vim.keymap.set({ "n", "v" }, "<leader>oo", "<cmd> Ollama Raw<cr>", { desc = "[O]llama Prompt" })
vim.keymap.set({ "v" }, "<leader>oe", "<cmd>Ollama Explain_Code<cr>", { desc = "[O]llama Explain Code" })
vim.keymap.set({ "v" }, "<leader>of", "<cmd>Ollama Fix_Code<cr>", { desc = "[O]llama Fix Code" })
vim.keymap.set({ "v" }, "<leader>og", "<cmd>Ollama Fix_grammar<cr>", { desc = "[O]llama Fix Grammar" })
vim.keymap.set({ "n", "v" }, "<leader>aa", function()
  require("avante.api").ask()
end, { desc = "avante: ask" })
vim.keymap.set({ "n" }, "<leader>ar", function()
  require("avante.api").refresh()
end, { desc = "avante: refresh" })
vim.keymap.set({ "v" }, "<leader>ae", function()
  require("avante.api").edit()
end, { desc = "avante: edit" })

-- Telescope
vim.keymap.set({ "n" }, "<leader>s?", "<cmd>Telescope <cr>", { desc = "Telescope" })
vim.keymap.set({ "n" }, "<leader>?", "<cmd> Telescope oldfiles<cr>", { desc = "[?] Find recently opened files" })
vim.keymap.set({ "n" }, "<leader><space>", "<cmd>Telescope buffers<cr>", { desc = "[ ] Find existing buffers" })
vim.keymap.set({ "n" }, "<leader>sp", "<cmd>Telescope gh pull_request<cr>", { desc = "[S]earch PRs" })
vim.keymap.set({ "n" }, "<leader>si", "<cmd>Telescope gh issues<cr>", { desc = "[S]earch Issues" })
vim.keymap.set({ "n" }, "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "[S]earch [F]iles" })
vim.keymap.set({ "n" }, "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "[S]earch current [W]ord" })
vim.keymap.set({ "n" }, "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "[S]earch by [G]rep" })
vim.keymap.set({ "n" }, "<leader>ds", "<cmd>Trouble diagnostics toggle<cr>", { desc = "[S]how Diagnostics" })
vim.keymap.set({ "n" }, "<leader>su", ":Telescope undo<cr>", { desc = "[S]earch [U]ndo" })
vim.keymap.set(
  "n",
  "<leader>se",
  ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
  { desc = "[S]earch [E]xplorer" }
)
vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "[S]how [T]odos" })

--- Language
vim.keymap.set("n", "<leader>fa", "<cmd>ChefFindAny<cr>", { desc = "Chef Find" })
vim.keymap.set("n", "<leader>fs", "<cmd>ChefFindAnySplit<cr>", { desc = "Chef Find (Split)" })

-- DAP
vim.keymap.set("n", "<F1>", "<cmd> lua require('dap').step_back()<cr>", opts)
vim.keymap.set("n", "<F2>", "<cmd> lua require('dap').step_into()<cr>", opts)
vim.keymap.set("n", "<F3>", "<cmd> lua require('dap').step_over()<cr>", opts)
vim.keymap.set("n", "<F4>", "<cmd> lua require('dap').step_out()<cr>", opts)
vim.keymap.set("n", "<F5>", "<cmd> lua require('dap').continue()<cr>", opts)
vim.keymap.set("n", "<leader>dr", "<cmd> lua require('dap').repl.open()<cr>", opts)
vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>dk", "<cmd> lua require'dap.ui.widgets'.hover()<cr>", opts)
vim.keymap.set("n", "<leader>do", "<cmd> lua require'dapui'.toggle()<cr>", opts)
vim.keymap.set("n", "<leader>dl", "<cmd> lua require'osv'.run_this()<cr>", opts)
vim.keymap.set("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ")
end)
