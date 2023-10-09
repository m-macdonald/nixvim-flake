modules: {
  pkgs,
  ...
}:
{
  topLevelModules = [
    ./modules/output.nix
  ] 
  ++ (modules pkgs);
}
