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
    clangd.enable = true;
    csharp_ls.enable = true;
    cssls.enable = true;
    eslint.enable = true;
    gopls.enable = true;
    html.enable = true;
    jsonls.enable = true;
    lua_ls.enable = true;
    nil_ls.enable = true;
    ocamllsp = {
      enable = true;
      package = null;
    };
    omnisharp.enable = true;
    qmlls.enable = true;
    rust_analyzer = {
      enable = true;
      installRustc = false;
      installCargo = false;
    };
    svelte.enable = true;
    tailwindcss.enable = true;
    ts_ls.enable = true;
    templ.enable = true;
    yamlls.enable = true;
    zls.enable = true;
  };
  # };
}
