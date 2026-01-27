{
  conform-nvim = {
    enable = true;
    autoInstall.enable = true;
    settings = {
      formatters_by_ft = {
        nix = ["alejandra"];
        md = ["cbfmt"];
        cs = ["csharpier"];
        css = ["css_beautify"];
        json = ["fixjson"];
        go = ["gofumpt"];
        html = ["html_beautify"];
        Dockerfile = ["dockerfmt"];
        lua = ["lua-format"];
        js = ["prettier"];
        ts = ["prettier"];
        jsx = ["prettier"];
        tsx = ["prettier"];
        yml = ["prettier"];
        yaml = ["prettier"];
        rs = ["rustfmt"];
        templ = ["templ"];
        "*" = ["codespell"];
      };
    };
  };
}
