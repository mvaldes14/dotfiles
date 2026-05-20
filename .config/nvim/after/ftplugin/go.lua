local map = function(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { buffer = 0, desc = desc, silent = true })
end

-- Test
map("<leader>rt", "<cmd>GoTestFunc<cr>",      "[Go] Test func under cursor")
map("<leader>rT", "<cmd>GoTestPkg<cr>",       "[Go] Test package")
map("<leader>rf", "<cmd>GoTestFile<cr>",      "[Go] Test file")
map("<leader>rc", "<cmd>GoCoverage -t<cr>",   "[Go] Toggle coverage")

-- Codegen
map("<leader>re", "<cmd>GoIfErr<cr>",         "[Go] Insert if err")
map("<leader>rs", "<cmd>GoFillStruct<cr>",    "[Go] Fill struct")
map("<leader>rw", "<cmd>GoFillSwitch<cr>",    "[Go] Fill switch")
map("<leader>ra", "<cmd>GoAddTag<cr>",        "[Go] Add struct tag")
map("<leader>rA", "<cmd>GoRmTag<cr>",         "[Go] Remove struct tag")
map("<leader>ri", "<cmd>GoImpl<cr>",          "[Go] Implement interface")

-- Docs (neogen)
map("<leader>rd", function() require("neogen").generate { type = "func" } end, "[Go] Doc: func")
map("<leader>rD", function() require("neogen").generate { type = "type" } end, "[Go] Doc: type")

-- Build / Run / Mod
map("<leader>rb", "<cmd>GoBuild<cr>",         "[Go] Build")
map("<leader>rr", "<cmd>GoRun<cr>",           "[Go] Run")
map("<leader>rg", "<cmd>GoGenerate<cr>",      "[Go] Generate")
map("<leader>rm", "<cmd>GoModTidy<cr>",       "[Go] Mod tidy")
map("<leader>rv", "<cmd>GoVet<cr>",           "[Go] Vet")
