{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.custom.windowManager.hyprland;
in {
  options.custom.windowManager.hyprland.enable = lib.mkEnableOption "Install Hyprland";

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${system}.default
      fuzzel
      mako
      matugen
      swww
      swayidle
      swaylock
      xdg-desktop-portal-gtk
      quickshell
    ];
  };
}
