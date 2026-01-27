{
  telescope = {
    enable = true;
    extensions = {
      fzf-native = {
        enable = true;
      };
    };
    keymaps = {
      # Broken right now. I don't use it enough to figure out what I've done wrong
      # "<leader>?" = {
      #   action = "old_files";
      #   desc = "[?] Find recently opened files";
      # };
      "<leader><space>" = {
        action = "buffers";
        options.desc = "[ ] Find existing buffers";
      };
      # "<leader>/" = {
      #   action = ""
      # };
      "<leader>sf" = {
        action = "find_files";
        options.desc = "[S]earch [F]iles";
      };
      "<leader>sh" = {
        action = "help_tags";
        options.desc = "[S]earch [H]elp";
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
    };
  };
}
