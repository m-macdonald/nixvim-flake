{
  treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      incremental_selection = {
        enable = true;
        keymaps = {
          # TODO: reevaluate these mappings
          init_selection = "<c-space>";
          node_incremental = "<c-space>";
          scope_incremental = "<c-s>";
          node_decremental = "<M-space>";
        };
      };
    };
  };
  treesitter-context = {
    enable = true;
  };
}
