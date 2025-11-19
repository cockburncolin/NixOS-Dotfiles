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

  imports = [
    ./rust.nix
    ./zig.nix
  ];

  options.custom.developmentUtils.enable = lib.mkEnableOption "Install development utilities";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      alejandra
      clang-tools
      direnv
      gcc
      git
      lazygit
      man-pages
      man-pages-posix
      nil
      nixd
      tealdeer
      vscode-fhs
      zed-editor
    ];

    # needed for man pages to work
    documentation.dev.enable = true;

  };
}
