{
  lint = {
    enable = true;
    lintersByFt = {
      dockerfile = [
        "hadolint"
      ];
      javascript = [
        "biomejs"
      ];
      typescript = [
        "biomejs"
      ];
      json = [
        "biomejs"
      ];
      rust = [
        "clippy"
      ];
      go = [
        "golangcilint"
      ];
      markdown = [
        "markdownlint"
      ];
      nix = [
        "nix"
        "deadnix"
      ];
      toml = [
        "tombi"
      ];
      yaml = [
        "yamllint"
      ];
      "*" = [
        "codespell"
        "detct-secrets"
      ];
    };
  };
}
