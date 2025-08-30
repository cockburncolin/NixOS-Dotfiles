{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.custom.games;
in {
  options.custom.games.enable = lib.mkEnableOption "Install Game Launchers";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [lutris];
    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
