{ conf, ... }:  let 
  #cfg = config.nixvim;
in { 
  # options = {
  #   nixvim = {
  #     lsp = mkOption {
  #       default = {};
  #       type = types.attrset;
  #     };
  #   };
  # };

  config = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    options = {
      hlsearch = false;
      number = true;
      relativenumber = true;
      termguicolors = true;
      clipboard = "unnamedplus";
      breakindent = true;
      undofile = true;

      # Case insensitive searching unless /C or capital in search
      ignorecase = true;
      smartcase = true;

      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      
      signcolumn = "yes";

      updatetime = 250;
      timeout = true;
      timeoutlen = 300;

      # Set completeopt to have a better completion experience
      completeopt = "menuone,noselect";
    };
    colorschemes.catppuccin.enable = true;
    keymaps = [
      {
        mode = ["n" "v"];
        key = "<Space>";
        action = "<Nop>";
        options = {
          silent = true;
        };
      }
      # Open netrw
      {
        mode = "n";
        key = "<leader>fv";
        action = ":Ex<cr>";
        options = {
          silent = true;
          desc = "Open [F]ile [V]iewer";
        };
      }
      # Stay in visual mode when tabbing
      {
        mode = "v";
        key = "<S-Tab>";
        action = "<gv";
        options = {
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<Tab>";
        action = ">gv";
        options = {
          silent = true;
        };
      }
      # Split current buffer
      {
        mode = "n";
        key = "<leader>sb";
        action = "<C-w>s";
        options = {
          desc = "[S]plit [B]uffer";
          silent = true;
        };
      }
      # Navigate split buffers
      {
        mode = "n";
        key = "<C-n>";
        action = "<C-w>h";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-e>";
        action = "<C-w>j";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-i>";
        action = "<C-w>k";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-o>";
        action = "<C-w>l";
        options = {
          silent = true;
        };
      }
      # Telescope
      {
        mode = "n";
        key = "<leader>?";
        action = "require('telescope.builtin').oldFiles";
        lua = true;
        options = {
          desc = "[?] Find recently opened files";
        };
      }
      {
        mode = "n";
        key = "<leader><space>";
        action = "require('telescope.builtin').buffers";
        lua = true;
        options = {
          desc = "[ ] Find existing buffers";
        };
      }
      {
        mode = "n";
        key = "<leader>/";
        action = ''
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = true,
          })
        '';
        lua = true;
        options = {
          desc = "[/] Fuzzily search in current buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>sf";
        action = "require('telescope.builtin').find_files";
        lua = true;
        options = {
          desc = "[S]earch [F]iles";
        };
      }
      {
        mode = "n";
        key = "<leader>sh";
        action = "require('telescope.builtin').help_tags";
        lua = true;
        options = {
          desc = "[S]earch [H]elp";
        };
      }
      {
        mode = "n";
        key = "<leader>sw";
        action = "require('telescope.builtin').grep_string";
        lua = true;
        options = {
          desc = "[S]earch current [W]ord";
        };
      }
      {
        mode = "n";
        key = "<leader>sg";
        action = "require('telescope.builtin').live_grep";
        lua = true;
        options = {
          desc = "[S]earch by [G]rep";
        };
      }
      {
        mode = "n";
        key = "<leader>sd";
        action = "require('telescope.builtin').diagnostics";
        lua = true;
        options = {
          desc = "[S]earch [D]iagnostics";
        };
      }
    ];
    plugins = {
      comment-nvim = {
        enable = true;
      };
      # TODO: Define the signs to use
      gitsigns = {
        enable = true;

      };
      which-key = {
        enable = true;
      };
      fidget = {
        enable = true;
      };
      lualine = {
        enable = true;
        theme = "catppuccin";
      };
      # TODO: There are some keymaps I need to move over from my original config
      telescope = {
        enable = true;
        extensions = {
          fzf-native = {
            enable = true;
          };
        };
      };
      # TODO: There is a lot of setup in my original that needs to be transferred here
      treesitter = {
        enable = true;
        indent = true;
        incrementalSelection = {
          enable = true;
          keymaps = {
            # TODO: reevaluate these mappings
            initSelection = "<c-space>";
            nodeIncremental = "<c-space>";
            scopeIncremental = "<c-s>";
            nodeDecremental = "<M-space>";
          };
        };
      };
      cmp-nvim-lsp = {
        enable = true;
      };
      nvim-cmp = {
        enable = true;
        mapping = {
          "<CR>" = ''
            cmp.mapping.confirm (
              {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
              }
            )
          '';
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
      treesitter-context = {
        enable = true;
      };
      lsp = {
        enable = true;
        onAttach = ''
          vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
          end, {desc = 'Format current buffer with LSP'})
          '';
        keymaps = {
          diagnostic = {
            "[d" = "goto_prev";
            "]d" = "goto_next";
            "<leader>e" = "open_float";
            "<leader>q" = "setloclist";
          };
          lspBuf = {
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";

            "gd" = "definition";
            #TODO: Original config uses telescope to do this. might switch back to that depending on results
            "gr" = "references";
            "gi" = "implementation";
            "gt" = "type_definition";
            "K" = "hover";
            "<C-k>" = "signature_help";

          };
        };
        servers = conf;
      };
    };
  };
}
