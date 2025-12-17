return {
  filetypes = { "yaml", "yml" },
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      hover = true,
      completion = true,
      validate = false,
      schemaStore = {
        url = "",
        enable = false,
      },
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.34.1-standalone/all.json"] =
        { "**/*yaml" },
        ["https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/all.json"] = { "*flux*/*.yaml" },
        ["https://www.schemastore.org/kustomization.json"] = { "kustomization.yaml", "kustomization.yml" },
        ['https://json.schemastore.org/github-workflow.json'] = ".github/workflows/*.{yml,yaml}",
        ["https://taskfile.dev/schema.json"] = { "Taskfile.yaml", "Taskfile.dist.yaml", "Taskfile.yml", "Taskfile.dist.yml" },
        ["https://starship.rs/config-schema.json"] = { "starship.toml" },
        ["https://raw.githubusercontent.com/compose-spec/compose-go/master/schema/compose-spec.json"] = { "**/docker-compose.yml", "**/docker-compose.yaml", "**/docker-compose.*.yml", "**/docker-compose.*.yaml", "**/compose.yml", "**/compose.yaml", "**/compose.*.yml", "**/compose.*.yaml" },
        ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = { "*.cf.json", "*.cf.yml", "*.cf.yaml", "cloudformation.json", "cloudformation.yml", "cloudformation.yaml" },
        ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/vars.json"] = { "**/vars/*.yml", "**/vars/*.yaml", "**/defaults/*.yml", "**/defaults/*.yaml", "**/host_vars/*.yml", "**/host_vars/*.yaml", "**/group_vars/*.yml", "**/group_vars/*.yaml" },
        ["https://raw.githubusercontent.com/ansible/ansible-navigator/main/src/ansible_navigator/data/ansible-navigator.json"] = { ".ansible-navigator.json", ".ansible-navigator.yaml", ".ansible-navigator.yml", "ansible-navigator.json", "ansible-navigator.yaml", "ansible-navigator.yml" },
        ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/inventory.json"] = { "inventory.yml", "inventory.yaml" },
        ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible-lint-config.json"] = { ".ansible-lint", "**/.config/ansible-lint.yml" },
        ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = { "playbook.yml", "playbook.yaml", "site.yml", "site.yaml", "**/playbooks/*.yml", "**/playbooks/*.yaml" },
        ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] = { "**/tasks/*.yml", "**/tasks/*.yaml", "**/handlers/*.yml", "**/handlers/*.yaml" },
      },
    },
  },
}
