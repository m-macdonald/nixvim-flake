{
  description = "Baseline nixvim configuration to be used as an input to my project flakes";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixvim, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system: let
      make = { lsp }: let 
        nixvim' = nixvim.legacyPackages."${system}";
        modules = import ./modules { conf = lsp; };
#        module = modules // lsp;
      in 
        nixvim'.makeNixvimWithModule {
          module = modules;
        };
    in {
      legacyPackages = {
        inherit make;
      };
    });
}
