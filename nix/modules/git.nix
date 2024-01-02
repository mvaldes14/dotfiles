{ ... }:
{
  programs.git = {
    enable = true;
    userName = "mvaldes";
    userEmail = "mvaldes.revilla@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
