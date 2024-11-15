-- vim.keymap.sets
local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)

-- Normal --
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Insert --
-- Press jk fast to enter
vim.keymap.set("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
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

-- Copy and Paste without system clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y',
  { noremap = true, silent = true, desc = "Yank to clipboard" })
vim.keymap.set(
  { "n", "v", "x" },
  "<leader>Y",
  '"+yy',
  { noremap = true, silent = true, desc = "Yank line to clipboard" }
)
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p',
  { noremap = true, silent = true, desc = "Paste from clipboard" })

-- Core
vim.keymap.set({ "n" }, "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set({ "n" }, "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })
vim.keymap.set({ "n" }, "<leader>i", "<cmd>nohlsearch<cr>", { desc = "Help", silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>hh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
vim.keymap.set({ "n" }, "<leader>ba", "<cmd>BufferLineCloseOthers<cr>",
  { desc = "[B]uffer Close all But Current" })
vim.keymap.set("n", "<C-s>", "<Esc>:w<CR>", opts)
vim.keymap.set("n", "<C-q>", "<Esc>:q<CR>", opts)
vim.keymap.set("c", "Q", "<cmd>qa!<cr>", opts)
vim.keymap.set({ "n" }, "<leader>sH", function() Snacks.notifier.show_history() end,
  { desc = "Show Notification History" })
vim.keymap.set({ "n" },
  "<leader>bc",
  function()
    Snacks.bufdelete()
  end,
  { desc = "[B]uffer Delete ",
  })


-- Files
vim.keymap.set({ "n" }, "<leader>E", "<cmd>Oil --float <cr>", { desc = "Oil Float" })


-- Git
vim.keymap.set({ "n" }, "<leader>G", "<cmd>Git<cr>", { desc = "Git" })
vim.keymap.set({ "n" }, "<leader>g", "<cmd>Neogit<cr>", { desc = "NeoGit" })
vim.keymap.set({ "n" }, "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git Blame" })
vim.keymap.set({ "n" }, "<leader>gd", "<cmd>Git diffthis<cr>", { desc = "Git Diff" })
vim.keymap.set({ "n" }, "<leader>gr", "<cmd>Octo pr list<cr>", { desc = "Octo" })


-- Random
vim.keymap.set({ "n" }, "<leader>Z", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })
vim.keymap.set({ "n" }, "<leader>tt", "<cmd>ToggleTodo<cr>", { desc = "[T]oggle Todo" })
vim.keymap.set("n", "<leader>xx", "<cmd>require('kuala').run()<cr>", { desc = "Execute Request" })


-- LSP
vim.keymap.set({ "n" }, "<leader>sh", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
  { desc = "[S]how Inlay Hints" })
vim.keymap.set({ "n" }, "<leader>rn", vim.lsp.buf.rename, { desc = "LSP:[R]ename" })
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP:[C]ode [A]ction" })
vim.keymap.set({ "n" }, "[d", vim.diagnostic.goto_prev, { desc = "LSP:Previous diagnostic" })
vim.keymap.set({ "n" }, "]d", vim.diagnostic.goto_next, { desc = "LSP:Next diagnostic" })
vim.keymap.set({ "n" }, "<leader>e", vim.diagnostic.open_float, { desc = "LSP:Show diagnostic [E]rror messages" })
vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition, { desc = "LSP:[G]oto [D]efinition" })
vim.keymap.set({ "n" }, "gr", 'require("telescope.builtin").lsp_references', { desc = "LSP:[G]oto [R]eferences" })
vim.keymap.set({ "n" }, "gI", vim.lsp.buf.implementation, { desc = "LSP:[G]oto [I]mplementation" })
vim.keymap.set({ "n" }, "<leader>D", vim.lsp.buf.type_definition, { desc = "LSP:Type [D]efinition" })
vim.keymap.set({ "n" }, "<leader>ds", 'require("telescope.builtin").lsp_document_symbols',
  { desc = "LSP: [D]ocument [S]ymbols" })
vim.keymap.set({ "n" }, "<leader>ws", 'require("telescope.builtin").lsp_dynamic_workspace_symbols',
  { desc = "LSP: [W]orkspace [S]ymbols" })
vim.keymap.set({ "n" }, "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set({ "n" }, "<leader>F", vim.cmd.Format, { desc = "Format Document" })
vim.keymap.set({ "n" }, "<A-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })


-- AI
vim.keymap.set({ "n", "v" }, "<leader>oo", "<cmd> Ollama Raw<cr>", { desc = "[O]llama Prompt" })
vim.keymap.set({ "v" }, "<leader>oe", "<cmd>Ollama Explain_Code<cr>", { desc = "[O]llama Explain Code" })
vim.keymap.set({ "v" }, "<leader>of", "<cmd>Ollama Fix_Code<cr>", { desc = "[O]llama Fix Code" })
vim.keymap.set({ "v" }, "<leader>og", "<cmd>Ollama Fix_grammar<cr>", { desc = "[O]llama Fix Grammar" })
vim.keymap.set({ "n", "v" }, "<leader>aa", function() require("avante.api").ask() end, { desc = "avante: ask" })
vim.keymap.set({ "n" },
  "<leader>ar",
  function()
    require("avante.api").refresh()
  end,
  { desc = "avante: refresh",
  })
vim.keymap.set({ "v" },
  "<leader>ae",
  function()
    require("avante.api").edit()
  end,
  { desc = "avante: edit"
  })

-- Telescope
vim.keymap.set("n", "<leader>?", 'require("telescope.builtin").oldfiles', { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", '<cmd>Telescope buffers<cr>', { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>sp", "<cmd>Telescope gh pull_request<cr>", { desc = "[S]earch PRs" })
vim.keymap.set("n", "<leader>si", "<cmd>Telescope gh issues<cr>", { desc = "[S]earch Issues" })
vim.keymap.set("n", "<leader>sf", '<cmd>Telescope find_files<cr>', { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sw", '<cmd>Telescope grep_string<cr>', { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", '<cmd>Telescope live_grep<cr>', { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>ds", "<cmd>Trouble diagnostics toggle<cr>", { desc = "[S]how Diagnostics" })
vim.keymap.set("n", "<leader>su", ":Telescope undo<cr>", { desc = "[S]earch [U]ndo" })
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
