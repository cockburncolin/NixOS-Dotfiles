{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.windowManager;
in {
  imports = [
    ./hyprland.nix
    ./kde.nix
    ./niri.nix
  ];

  options.custom.windowManager = {
    enable = lib.mkEnableOption "Install window manager utilities";
  };

  config = lib.mkIf cfg.enable {
    services = {
      displayManager.gdm.enable = true;
      xserver.xkb = {
        layout = "us";
        variant = "";
      };
    };

    environment.systemPackages = with pkgs; [
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
      nerd-fonts.jetbrains-mono
      nerd-fonts.inconsolata
    ];

    services.gnome.gnome-keyring.enable = true;

    # needed for blu-ray drive
    boot.kernelModules = ["sg"];
  };
}
