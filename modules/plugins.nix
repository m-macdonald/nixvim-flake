{
    comment-nvim = {
        enable = true;
    };
    indent-blankline = {
        enable = true;
        indent = {
            char = "┊";
        };
        scope.enabled = false;
    };
# TODO: Define the signs to use
    gitsigns = {
        enable = true;
        signs = {
            add.text = "+";
            change.text = "~";
            delete.text = "--";
            topdelete.text = "‾";
            changedelete.text = "~";
        };
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
                desc = "[ ] Find existing buffers";
            };
# "<leader>/" = {
#   action = ""
# };
            "<leader>sf" = {
                action = "find_files";
                desc = "[S]earch [F]iles";
            };
            "<leader>sh" = {
                action = "help_tags";
                desc = "[S]earch [H]elp";
            };
            "<leader>sw" = {
                action = "grep_string";
                desc = "[S]earch current [W]ord";
            };
            "<leader>sg" = {
                action = "live_grep";
                desc = "[S]earch by [G]rep";
            };
            "<leader>sd" = {
                action = "diagnostics";
                desc = "[S]earch [D]iagnostics";
            };
        };
    };
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
        snippet.expand = "luasnip";
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
        { name = "luasnip"; }
        { name = "path"; }
        { name = "buffer"; }
        ];
    };
    treesitter-context = {
        enable = true;
    };
    cmp_luasnip = {
        enable = true;
    };
    luasnip = {
        enable = true;
    };
    lsp = import ./lsp.nix;
    fugitive = {
        enable = true;
    };
# harpoon = {
#   enable = true;
#   keymaps = {};
# };
}
