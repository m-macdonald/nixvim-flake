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
        keymaps = {
            addFile = "<leader>a";
            toggleQuickMenu = "<C-e>";
            navFile = {
                "1" = "<C-t>";
                "2" = "<C-s>";
                "3" = "<C-r>";
                "4" = "<C-a>";
            };
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
    cmp = {
        enable = true;
        settings = {
            view = { name = "custom"; selection_order = "near_cursor";};
            formatting = {
                fields = [ "abbr" "kind" "menu" ];
                format = ''
                    function(entry, vim_item)
                        vim_item.menu = nil

                        return vim_item
                    end'';
            };
            snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
            mapping = {
                "<CR>" = ''
                    cmp.mapping.confirm ({
                            behavior = cmp.ConfirmBehavior.Replace,
                            select = true,
                    })'';
                "<C-d>" = "cmp.mapping.scroll_docs(-4)";
                "<C-f>" = "cmp.mapping.scroll_docs(4)";
                "<C-Space>" = "cmp.mapping.complete()";
                "<Tab>" = ''
                    cmp.mapping(function(fallback)
                        luasnip = require('luasnip')
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, {"i", "s"})
                '';
                "<S-Tab>" = ''
                    cmp.mapping(function(fallback)
                        luasnip = require('luasnip')
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {"i", "s"})
                '';
            };
            sources = [
                { name = "nvim_lsp"; }
                { name = "luasnip"; }
                { name = "path"; }
                { name = "buffer"; }
            ];
            window = {
                completion.border = [ "┌" "─" "┐" "│" "┘" "─" "└" "│" ];
                documentation.border = [ "┌" "─" "┐" "│" "┘" "─" "└" "│" ];
            };
        };
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
    trouble = {
        enable = true;
        settings.action_keys = {
        };
    };
}
