{
  description = "Baseline nixvim configuration to be used as an input to my project flakes";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixvim, flake-utils, nixpkgs } @inputs:
    with nixpkgs.lib;
    with builtins; let
     # nixvimModules = map (f: ./modules + "/${f}") (attrNames (builtins.readDir ./modules));
     modules = pkgs: 
      [
        rec {
          _file = ./flake.nix;
          key = _file;
          config = {
            _module.args = {
              pkgs = mkForce pkgs;
              inherit (pkgs) lib;
              inherit inputs;
            };
          };
        }
      ];
    in flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      make = import ./wrappers/make.nix;
      # hmModule = import ./wrappers/hm.nix modules;
    in {
      packages = {
        default = import ./wrappers/standalone.nix pkgs modules {module = {};};
      };
      homeManagerModules.nixvim = import ./wrappers/hm.nix modules;
    });
}
