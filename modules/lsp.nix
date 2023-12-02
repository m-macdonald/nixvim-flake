{
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

    servers = {
        astro.enable = true;
        bashls.enable = true;
        csharp-ls.enable = true;
        cssls.enable = true;
        eslint.enable = true;
        gopls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        lua-ls.enable = true;
        nil_ls.enable = true;
        ocaml-lsp.enable = true;
        omnisharp.enable = true;
        rust-analyzer.enable = true;
        svelte.enable = true;
        tailwindcss.enable = true;
        tsserver.enable = true;
        yamlls.enable = true;
        zls.enable = true;
    };
# };
}
