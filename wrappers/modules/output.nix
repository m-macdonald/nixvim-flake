{
  nvimConfig,
  pkgs,
  lib,
  inputs,
  ...
}:
/*
with lib; {
  options = {
    finalPackage = mkOption {
      type = types.package;
      description = "Wrapped nixvim";
      readOnly = true;
    };
  };

  config = let 
    nixvim' = inputs.nixvim.legacyPackages."x86_64-linux";
    # wrappedNixvim = import ../make.nix { inherit modules; lsp = config.config; };
    wrappedNixvim = nixvim'.makeNixvim nvimConfig;
  in {
    finalPackage = wrappedNixvim;
  };
}
*/
let 
  nixvim' = inputs.nixvim.legacyPackages."x86_64-linux";
  # wrappedNixvim = import ../make.nix { inherit modules; lsp = config.config; };
  wrappedNixvim = nixvim'.makeNixvim nvimConfig;
in
  wrappedNixvim
