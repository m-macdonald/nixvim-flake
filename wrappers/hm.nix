{
  config,
  lib,
  ...
}: let 
  inherit (lib) mkEnableOption mkOption mkMerge mkIf types;
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
      ]);
    };
  };
/*
  config = mkIf cfg.enable (
    mkMerge [
      {home.packages = [ import ./make { lsp = cfg.config; } ];}
      {
        home.sessionVariables = mkIf cfg.defaultEditor { EDITOR = "nvim"; };
      }
    ]
    );
    */

    config = 
}
