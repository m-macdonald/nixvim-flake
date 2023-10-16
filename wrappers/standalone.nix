{
  pkgs,
  inputs,
  nvimConfig,
  lib
} @args: let
  inherit (pkgs) lib;

  shared = import ./_shared.nix args;

  /*
  eval = lib.evalModules {
     modules = shared.topLevelModules;
  };
*/
  # handleAssertions = config: let
  #   failedAssertions = map (x: x.message) (lib.filter (x: !x.assertion) config.assertions);
  # in
  #   if failedAssertions != []
  #   then throw "\nFailed assertions:\n${builtins.concatStringsSep "\n" (map (x: "- ${x}") failedAssertions)}"
  #   else lib.showWarnings config.warnings config;

  # cfg = /* handleAssertions */ eval.config;
in 
  import ./modules/output.nix args
