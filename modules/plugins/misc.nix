{lib, ...}:
{
  comment.enable = true;

  indent-blankline = {
    enable = true;
    settings = {
      indent.char = "┊";
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

  marks = {
    enable = true;
    settings = {
      default_mappings = true;
      builtin_marks = ["."];
      cyclic = true;
      refresh_interval = 250;
      sign_priority = {
        lower = 10;
        upper = 15;
        builtin = 8;
        bookmark = 20;
      };
    };
  };
 
  which-key = {
    enable = true;
    settings.spec = [
      {
        __unkeyed-1 = "<leader>b";
        group = "Buffer";
      }
      {
        __unkeyed-1 = "<leader>d";
        group = "Debug";
      }
      {
        __unkeyed-1 = "<leader>g";
        group = "Git";
      }
      {
        __unkeyed-1 = "<leader>m";
        group = "Marks";
      }
      {
        __unkeyed-1 = "<leader>s";
        group = "Search";
      }
      {
        __unkeyed-1 = "<leader>t";
        group = "Trouble";
      }
    ];
  };

  fidget.enable = true;

  lualine.enable = true;

  project-nvim.enable = true;

  web-devicons.enable = true;

  lazygit = {
    enable = true;
    settings = {
      config_file_path = lib.nixvim.emptyTable;
      floating_window_border_chars = [
        "╭"
        "─"
        "╮"
        "│"
        "╯"
        "─"
        "╰"
        "│"
      ];
    };
  };

  mini-files = {
    enable = true;
    settings = {
      mappings = {
        close = "q";
        go_in = "l";
        go_in_plus = "L";
        go_out = "h";
        go_out_plus = "H";
        reset = "<BS>";
        synchronize = "w";
        trim_left = "<";
        trim_right = ">";
      };
      options = {
        permanent_delete = false;
        use_as_default_explorer = true;
      };
      windows = {
        max_number.__raw = "math.huge";
        preview = true;
        width_focus = 50;
        width_nofocus = 15;
        width_preview = 50;
      };
    };
  };

  mini-pairs.enable = true;

  mini-surround.enable = true;

  todo-comments = {
    enable = true;
    settings.signs = true;
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
