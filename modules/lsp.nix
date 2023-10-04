{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.lsp;
in {
  options.modules.lsp = {
    servers = mkOption {
      type = types.attrset;
    };
  };

  plugins.lsp.servers = {
    gopls = {
      enable = true;
    };
  };
}
