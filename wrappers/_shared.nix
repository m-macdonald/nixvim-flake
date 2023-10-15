{
  pkgs,
  nvimConfig,
  lib,
  inputs
}: 
{
  topLevelModules = [
    import ./modules/output.nix { inherit pkgs nvimConfig lib inputs; }
  ];
}
