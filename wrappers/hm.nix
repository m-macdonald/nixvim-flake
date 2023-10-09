modules: {
  config,
  pkgs,
  lib,
  ...
} @args: let 
  inherit (lib) mkEnableOption mkOption mkMerge mkIf types;
  shared = import ./_shared.nix modules args;
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
            config = mkOption {
              default = {};
              description = "The desired LSP configuration";
            };
          };
        }
      ]
      ++ shared.topLevelModules);
    };
  };

  config = mkIf cfg.enable (
    mkMerge [
      {home.packages = [ cfg.finalPackage ];}
      {
        home.sessionVariables = mkIf cfg.defaultEditor { EDITOR = "nvim"; };
      }
    ]
  );
}
