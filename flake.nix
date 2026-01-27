{
  description = "Baseline nixvim configuration to be used as an input to my project flakes";

  inputs = {
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixvim,
    flake-utils,
    nixpkgs,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      nixvimLib = nixvim.lib.${system};
      pkgs = import nixpkgs {inherit system;};
      lib = pkgs.lib;
      nvimConfig = import ./modules pkgs;
      nixvim' = nixvim.legacyPackages.${system};
      nvim = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = nvimConfig;
        extraSpecialArgs = {
          inherit self;
        };
      };
      hmModule = import ./wrappers/hm.nix {inherit nvim lib;};
    in {
      checks = {
        default = nixvimLib.check.mkTestDerivationFromNvim {
          inherit nvim;
          name = "nixvim";
        };
      };
      packages = {
        default = nvim;
      };
      homeManagerModules.nixvim = hmModule;

      formatter = pkgs.alejandra;
    });
}
