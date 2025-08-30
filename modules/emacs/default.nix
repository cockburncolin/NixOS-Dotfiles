{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.emacs;
in {
  options.custom.emacs.enable = lib.mkEnableOption "Enable Emacs editor";

  config = lib.mkIf cfg.enable {
    services.emacs = {
      enable = true;
      defaultEditor = true;
      startWithGraphical = true;
      install = true;
    };
  };
}
