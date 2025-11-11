{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.developmentUtils;
in
{
  options.custom.developmentUtils.enable = lib.mkEnableOption "Install development utilities";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      alejandra
      direnv
      git
      lazygit
      man-pages
      man-pages-posix
      nil
      nixd
      tealdeer
      zed-editor
    ];
    documentation.dev.enable = true;
  };
}
