{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.developmentUtils;
in {
  options.custom.developmentUtils.enable = lib.mkEnableOption "Install development utilities";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      alejandra
      clang
      fenix.complete.toolchain
      gcc
      git
      gnumake
      go
      gopls
      lazygit
      nil
      jdt-language-server
    ];

    programs.java = {
      enable = true;
    };
  };
}
