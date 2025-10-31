{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.musicProduction.reaper;
in {
  options.custom.musicProduction.reaper.enable = lib.mkEnableOption "Install Reaper";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      reaper
      neural-amp-modeler-lv2
    ];
  };
}
