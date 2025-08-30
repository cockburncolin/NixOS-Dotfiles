{config, lib, pkgs, ...}:
let
  cfg = config.custom.windowManager;
in {
  options.custom.windowManager = {
    enable = lib.mkEnableOption "Install window manager utilities";
  };

  config = lib.mkIf cfg.enable {
    services.displayManager.gdm.enable = true;
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      brave
      ghostty
      wofi
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
