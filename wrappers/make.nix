  { lsp, inputs, pkgs, ... }: let 
    nixvim' = inputs.nixvim.legacyPackages."${pkgs.system}";
    modules = import ./modules { conf = lsp; };
  #        module = modules // lsp;
  in 
    nixvim'.makeNixvimWithModule {
      module = modules;
    }
