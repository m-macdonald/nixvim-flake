{
  description = "Baseline nixvim configuration to be used as an input to my project flakes";

  inputs = {
    nixvim.url = "github:m-macdonald/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixvim, flake-utils, nixpkgs } @inputs:
    with nixpkgs.lib;
    with builtins; let
#      nixvimModules = map (f: ./modules + "/${f}") (attrNames (builtins.readDir ./modules));
#      modules = pkgs:
#       trace pkgs
#      ;
# #      nixvimModules;
# /*      [
#         rec {
#           file = ./flake.nix;
#           key = _file;
#           config = {
#             _module.args = {
#               pkgs = mkForce pkgs;
#               inherit (pkgs) lib;
#               inherit inputs;
#             };
#           };
#         }
#       ];*/
    in flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      lib = pkgs.lib;
      nvimConfig = import ./modules;
      hmModule = import ./wrappers/hm.nix { inherit pkgs inputs lib nvimConfig; };
      standalonePackage = import ./wrappers/standalone.nix { inherit pkgs inputs lib nvimConfig; };
    in {
      packages = {
         default = standalonePackage;
      };
      homeManagerModules.nixvim = hmModule;
    });
}
