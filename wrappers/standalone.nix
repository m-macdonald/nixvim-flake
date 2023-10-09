default_pkgs: modules: {
  pkgs ? default_pkgs,
  module,
}: let
  inherit (pkgs) lib;

  shared = import ./_shared.nix modules {
    inherit pkgs lib;
    config = {};
  };

  eval = lib.evalModules {
    modules = [module] ++ shared.topLevelModules;
  };

  config = eval.config;
  
in 
  config.finalPackage
