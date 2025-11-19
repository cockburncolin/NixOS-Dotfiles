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
    environment.systemPackages = with pkgs; [
      lutris
      (prismlauncher.override {
        additionalPrograms = with pkgs; [ffmpeg];
        jdks = with pkgs; [
          jdk21
          jdk17
          jdk8
        ];
      })
    ];
    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
