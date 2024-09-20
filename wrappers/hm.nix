{
  nvim,
  lib,
}: {config, ...}: let
  inherit (lib) mkEnableOption mkOption mkMerge mkIf types;
  cfg = config.programs.nixvim;
in {
  options = {
    programs.nixvim = mkOption {
      default = {};
      type = types.submodule [
        {
          options = {
            enable = mkEnableOption "nixvim";
            defaultEditor = mkEnableOption "Set nixvim as the default editor";
          };
        }
      ];
    };
  };

  config = mkIf cfg.enable (
    mkMerge [
      {home.packages = [nvim];}
      {
        home.sessionVariables = mkIf cfg.defaultEditor {EDITOR = "nvim";};
      }
    ]
  );
}
