{
  comment = {
    enable = true;
  };
  indent-blankline = {
    enable = true;
    settings = {
      indent = {
        char = "┊";
      };
      scope.enabled = false;
    };
  };
  gitsigns = {
    enable = true;
    settings = {
      signs = {
        add.text = "+";
        change.text = "~";
        delete.text = "--";
        topdelete.text = "‾";
        changedelete.text = "~";
      };
    };
  };
  harpoon = {
    enable = true;
    enableTelescope = true;
  };
  which-key = {
    enable = true;
  };
  fidget = {
    enable = true;
  };
  lualine = {
    enable = true;
  };
  project-nvim = {
    enable = true;
  };
  web-devicons = {
    enable = true;
  };
  mini-files = {
    enable = true;
    settings = {
      mappings = {
        close = "q";
        # Expand the current dir, or open current file
        go_in = "l";
        # Same as go_in, but closes Minifiles
        go_in_plus = "L";
        # Focus on the parent dir
        go_out = "h";
        # Same as go_out, but closes directories to the left
        go_out_plus = "H";
        reset = "<BS>";
        # Write the changes to the directory buffers to the filesystem
        synchronize = "w";
        trim_left = "<";
        trim_right = ">";
      };
      options = {
        permanent_delete = true;
        use_as_default_explorer = true;
      };
      windows = {
        # Functionally no limit on the number of windows shown side by side
        max_number.__raw = "math.huge";
        # Show a preview of the file or directory under the cursor
        preview = true;
        width_focus = 50;
        width_nofocus = 15;
        width_preview = 50;
      };
    };
  };
  fugitive = {
    enable = true;
  };
  trouble = {
    enable = true;
    settings = {
      auto_refresh = true;
      focus = true;
      warn_no_results = false;
      open_no_results = true;
    };
  };
}
