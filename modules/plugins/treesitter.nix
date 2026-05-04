{
  treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = false;
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<c-space>";
          node_incremental = "<c-space>";
          scope_incremental = "<c-s>";
          node_decremental = "<M-space>";
        };
      };
    };
  };
  treesitter-context.enable = true;
  ts-autotag.enable = true;
}
