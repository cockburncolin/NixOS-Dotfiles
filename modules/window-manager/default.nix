{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.windowManager;
in {
  imports = [./niri.nix];
  options.custom.windowManager = {
    enable = lib.mkEnableOption "Install window manager utilities";
  };

  config = lib.mkIf cfg.enable {
    services = {
      displayManager.gdm.enable = true;
      desktopManager.plasma6.enable = true;
      xserver.xkb = {
        layout = "us";
        variant = "";
      };
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
      protonvpn-gui
      brave
      ghostty
      handbrake
      kiwix
      makemkv
      mpv
      transmission-remote-gtk
      wl-clipboard
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.inconsolata
    ];

    # needed for blu-ray drive
    boot.kernelModules = ["sg"];
  };
}
