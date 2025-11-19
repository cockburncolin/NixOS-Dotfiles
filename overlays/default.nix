{
  inputs,
  ...
}:
{
  nixpkgs.overlays = [
    inputs.emacs-overlay.overlays.default
    inputs.fenix.overlays.default
  ];
}
