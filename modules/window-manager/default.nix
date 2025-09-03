{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.windowManager;
in {
  options.custom.windowManager = {
    enable = lib.mkEnableOption "Install window manager utilities";
  };

  config = lib.mkIf cfg.enable {
    services = {
      displayManager.gdm.enable = true;
      desktopManager.plasma6.enable = true;
    };

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      kate
      khelpcenter
      plasma-browser-integration
      konsole
      elisa
    ];

    environment.systemPackages = with pkgs; [
      ghostty
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.inconsolata
    ];

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
