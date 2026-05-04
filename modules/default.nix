{pkgs, ...}@args: {
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    number = true;
    relativenumber = true;
    cursorline = true;
    hlsearch = false;
    termguicolors = true;
    clipboard = "unnamedplus";
    undofile = true;
    swapfile = false;
    backup = false;

    ignorecase = true;
    smartcase = true;

    tabstop = 4;
    shiftwidth = 4;
    expandtab = true;
    smartindent = true;

    signcolumn = "yes";
    scrolloff = 8;
    wrap = false;
    splitright = true;
    splitbelow = true;

    updatetime = 50;
    timeoutlen = 300;

    completeopt = "menuone,noselect";
    colorcolumn = "80";
  };

  colorschemes.kanagawa-paper = {
    enable = true;
    settings.theme = "ink";
  };

  keymaps = import ./keymaps.nix;

  filetype.extension."templ" = "templ";

  plugins = import ./plugins args;

  autoGroups.yank_highlight.clear = true;

  autoCmd = [
    {
      event = ["TextYankPost"];
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
      group = "yank_highlight";
      pattern = ["*"];
    }
  ];

  dependencies = {
    ripgrep.enable = true;
    lazygit.enable = true;
  };

  extraPackages = with pkgs; [
    delve
    gcc
    # Formatters
    alejandra
    cbfmt
    gofumpt
    prettier
    stylua
    # Linters
    biome
    clippy
    codespell
    deadnix
    golangci-lint
    hadolint
    markdownlint-cli
    nix
    yamllint
  ];
}
