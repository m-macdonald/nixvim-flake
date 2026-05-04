{
  telescope = {
    enable = true;
    extensions.fzf-native.enable = true;
    keymaps = {
      "<leader><space>" = {
        action = "buffers";
        options.desc = "[ ] Find existing buffers";
      };
      "<leader>/" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "[/] Fuzzy search current buffer";
      };
      "<leader>sf" = {
        action = "find_files";
        options.desc = "[S]earch [F]iles";
      };
      "<leader>sh" = {
        action = "help_tags";
        options.desc = "[S]earch [H]elp";
      };
      "<leader>sk" = {
        action = "keymaps";
        options.desc = "[S]earch [K]eymaps";
      };
      "<leader>sw" = {
        action = "grep_string";
        options.desc = "[S]earch current [W]ord";
      };
      "<leader>sg" = {
        action = "live_grep";
        options.desc = "[S]earch by [G]rep";
      };
      "<leader>sd" = {
        action = "diagnostics";
        options.desc = "[S]earch [D]iagnostics";
      };
      "<leader>sr" = {
        action = "oldfiles";
        options.desc = "[S]earch [R]ecent";
      };
    };
  };
}
