return {
  settings = {
    nixd = {
      formatting = {
        command = { "alejandra " },
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.nixos.options',
        },
        home_manager = {
          expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations.nixos.options',
        },
      },
    },
  },
}
