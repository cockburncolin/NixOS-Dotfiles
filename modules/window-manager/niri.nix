{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.custom.windowManager.niri;
in {
  options.custom.windowManager.niri.enable = lib.mkEnableOption "Install Niri";

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${system}.default
	  gnome-keyring
	  xdg-desktop-portal-gtk
      fuzzel
      mako
      swayidle
      swaylock
    ];
  };
}
