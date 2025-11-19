{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.virt;
in {
  options.custom.virt.enable = lib.mkEnableOption "Install virtualization software";

  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;

    users.groups.libvirtd.members = ["colin"];

    virtualisation.libvirtd.enable = true;

    virtualisation.spiceUSBRedirection.enable = true;
  };
}
