{pkgs, ...}: {
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  opts = {
    hlsearch = false;
    number = true;
    cursorline = true;
    relativenumber = true;
    termguicolors = true;
    clipboard = "unnamedplus";
    undofile = true;
    swapfile = false;
    backup = false;

    # Case insensitive searching unless /C or capital in search
    ignorecase = true;
    smartcase = true;

    tabstop = 4;
    shiftwidth = 4;
    expandtab = true;
    smartindent = true;
    autoindent = true;

    signcolumn = "yes";

    updatetime = 50;
    timeout = true;
    timeoutlen = 300;

    # Set completeopt to have a better completion experience
    completeopt = "menuone,noselect";

    colorcolumn = "80";

    background = null;
  };
  colorschemes.kanagawa-paper = {
    enable = true;
    settings.theme = "ink";
  };
  keymaps = import ./keymaps.nix;
  filetype.extension = {
    "templ" = "templ";
  };
  plugins = import ./plugins pkgs;
  autoGroups = {
    yank_highlight = {
      clear = true;
    };
  };
  autoCmd = [
    {
      event = ["TextYankPost"];
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
      group = "yank_highlight";
      pattern = ["*"];
    }
  ];
  dependencies.ripgrep.enable = true;
  extraPackages = with pkgs; [
    # Required for go debugging
    delve
    gcc
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
