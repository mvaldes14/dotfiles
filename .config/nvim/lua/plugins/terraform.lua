return {
  "mvaldes14/terraform.nvim",
  ft = "terraform",
  opts = {
    cmd = "rg",
  },
  keys = {
    {
      "<leader>tp",
      "<cmd>TerraformPlan<cr>",
      desc = "Terraform Plan",
    },
    {
      "<leader>ti",
      "<cmd>TerraformInit<cr>",
      desc = "Terraform Init",
    },
    {
      "<leader>te",
      "<cmd>TerraformExplore<cr>",
      desc = "Terraform Explore",
    },
  },
}
