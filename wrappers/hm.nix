{
  nvimConfig,
  pkgs,
  lib,
  inputs,
}:
{
  config,
  ...
}: let 
  inherit (lib) mkEnableOption mkOption mkMerge mkIf types;
  # shared = import ./_shared.nix { inherit pkgs nvimConfig lib inputs; };
  package = import ./modules/output.nix { inherit nvimConfig pkgs inputs lib; };
  cfg = config.programs.nixvim;
in {
  options = {
    programs.nixvim = mkOption {
      default = {};
      type = types.submodule ([
        {
          options = {
            enable = mkEnableOption "nixvim";
            defaultEditor = mkEnableOption "Set nixvim as the default editor";
            # config = mkOption {
            #   default = {};
            #   description = "Add to or override the default configuration";
            #   type = types.attrset;
            # };
          };
        }
      ]);
#      ++ shared.topLevelModules);
    };
  };

  config = mkIf cfg.enable (
    mkMerge [
      { home.packages = [ package ]; }
      {
        home.sessionVariables = mkIf cfg.defaultEditor { EDITOR = "nvim"; };
      }
    ]
  );
}
