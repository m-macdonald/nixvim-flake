{
    config,
    lib,
    ...
}:
with lib; let
cfg = config.lsp;
in {
    options.modules.lsp = {
        servers = mkOption {
            type = types.attrset;
        };
    };

    config = {
        plugins.lsp.servers = {
            astrols.enable = true;
            bashls.enable = true;
            csharp-ls.enable = true;
            cssls.enable = true;
            eslint.enable = true;
            gopls.enable = true;
            html.enable = true;
            jsonls.enable = true;
            lua-ls.enable = true;
            nil_ls.enable = true;
            omnisharp.enable = true;
            rust-analyzer.enable = true;
            svelte.enable = true;
            tailwindcss.enable = true;
            tsserver.enable = true;
            yamlls.enable = true;
            zls.enable = true;
        };
    };
}
