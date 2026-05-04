{
  conform-nvim = {
    enable = true;
    settings.formatters_by_ft = {
      nix = ["alejandra"];
      markdown = ["prettier"];
      cs = ["csharpier"];
      css = ["prettier"];
      json = ["fixjson"];
      go = ["gofumpt"];
      html = ["prettier"];
      lua = ["stylua"];
      javascript = ["prettier"];
      typescript = ["prettier"];
      javascriptreact = ["prettier"];
      typescriptreact = ["prettier"];
      yaml = ["prettier"];
      rust = ["rustfmt"];
      templ = ["templ"];
      "*" = ["codespell"];
    };
  };
}
