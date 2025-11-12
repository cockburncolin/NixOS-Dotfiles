{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.emacs;
in
{
  options.custom.emacs.enable = lib.mkEnableOption "Enable Emacs editor";

  config = lib.mkIf cfg.enable {
    services.emacs = {
      enable = true;
      defaultEditor = true;
      startWithGraphical = false;
      install = true;
      package = pkgs.emacsWithPackagesFromUsePackage {
        config = ../../configs/dot-config/emacs/init.el;
        alwaysTangle = true;
        alwaysEnsure = true;
        extraEmacsPackages = epkgs: [
          epkgs.vterm
          pkgs.libvterm
        ];
      };
    };
  };
}
