{
  inputs,
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    inputs.fenix.overlays.default
  ];
}
