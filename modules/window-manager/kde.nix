{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.windowManager.kde;
in {
  options.custom.windowManager.kde = {
    enable = lib.mkEnableOption "Install KDE";
  };

  config = lib.mkIf cfg.enable {
    services = {
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
      kdePackages.isoimagewriter
      kdePackages.kaccounts-integration
      kdePackages.kaccounts-providers
      kdePackages.qtwebengine
    ];
  };
}
