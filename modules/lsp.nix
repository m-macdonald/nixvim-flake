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

  config = {
    plugins.lsp.servers = {
      gopls = {
        enable = true;
      };
    };
  };
}
