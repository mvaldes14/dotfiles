local map = function(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { buffer = 0, desc = "[Tf] " .. desc, silent = true })
end

map("<leader>tp", "<cmd>TerraformPlan<cr>",    "Plan")
map("<leader>ti", "<cmd>TerraformInit<cr>",    "Init")
map("<leader>te", "<cmd>TerraformExplore<cr>", "Explore")
