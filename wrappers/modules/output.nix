{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
with lib; let 

in {
  options = {
    finalPackage = mkOption {
      type = types.package;
      description = "Wrapped nixvim";
      readOnly = true;
    };
  };

  config = let 
    nixvim' = inputs.nixvim.legacyPackages."${pkgs.system}";
    # wrappedNixvim = import ../make.nix { inherit modules; lsp = config.config; };
    wrappedNixvim = nixvim'.makeNixvimWithModule {
      module = {};
      pkgs = pkgs;
#      module = config;
    };
  in {
    finalPackage = wrappedNixvim;
  };
}

