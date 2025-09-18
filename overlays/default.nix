{
  inputs,
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    inputs.fenix.overlays.default
    inputs.emacs-overlay.overlays.default
  ];
}
