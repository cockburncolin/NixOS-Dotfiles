{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    findNixFiles = dir: let
      entries = builtins.readDir dir;
    in
      lib.flatten (
        lib.mapAttrsToList (
          name: type:
            if type == "directory"
            then findNixFiles (dir + "/${name}")
            else if lib.hasSuffix ".nix" name
            then [(dir + "/${name}")]
            else []
        )
        entries
      );
  in {
    formatter.x86_64-linux = pkgs.alejandra;
    nixosConfigurations.caeser = lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules =
        [
          ./systems/caeser/configuration.nix
          (import ./overlays)
        ]
        ++ findNixFiles ./modules;
    };
  };
}
