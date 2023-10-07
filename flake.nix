{
  description = "Baseline nixvim configuration to be used as an input to my project flakes";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixvim, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system: let
      modules = import ./modules;
      make = import ./wrappers/make.nix;
      hmModule = import ./wrappers/hm.nix modules;
    in {
      legacyPackages = {
        inherit make;
      };
      inherit nixvim.homeManagerModules.nixvim;
    });
}
