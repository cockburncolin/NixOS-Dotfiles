{
  config,
  pkgs,
  lib,
  ...
}: {
  users = {
    users.colin = {
      isNormalUser = true;
      description = "Colin Cockburn";
      extraGroups = ["networkmanager" "wheel" "plugdev"];
      packages = with pkgs; [
        brave
        gh
        just
        stow
      ];
    };
  };
}
