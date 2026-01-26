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
  project-nvim = {
    enable = true;
    settings = {
        use_lsp = [
            "lsp"
            "pattern"
        ];
        patterns = [
            ".git"
            ".github"
            ".csproj"
            ".nvim.lua"
        ];
        showHidden = true;
    };
  };
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
  web-devicons = {
    enable = true;
  };
  blink-cmp = {
    enable = true;
    settings = {
      completion = {
        menu = {
          enabled = true;
        };
        documentation.auto_show = true;
        accept = {
          auto_brackets.enabled = false;
        };
        ghost_text.enabled = true;
        list.cycle = {
          from_top = true;
          from_bottom = true;
        };
      };
      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
      };
      keymap = {
        "<Esc>" = [
          "cancel"
          "fallback"
        ];
        "<C-y>" = [
          "accept"
          "fallback"
        ];
        "<C-space>" = [
          "show_documentation"
          "hide_documentation"
        ];
        "<C-Up>" = [
          "scroll_documentation_up"
        ];
        "<C-Down>" = [
          "scroll_documentation_down"
        ];
        "<Tab>" = [
          "select_next"
          "fallback"
        ];
        "<C-Tab>" = [
          "select_prev"
          "fallback"
        ];
      };
    };
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
  treesitter-context = {
    enable = true;
  };
  luasnip = {
    enable = true;
  };
  lsp = import ./lsp.nix;
  fugitive = {
    enable = true;
  };
  trouble = {
    enable = true;
  };
}
