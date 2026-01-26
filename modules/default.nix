{ ... }:
{
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

    signcolumn = "yes";

    updatetime = 50;
    timeout = true;
    timeoutlen = 300;

    # Set completeopt to have a better completion experience
    completeopt = "menuone,noselect";

    colorcolumn = "80";
  };
  colorschemes.one = {
    enable = true;
    settings = {
      allow-italics = 1;
    };
  };
  keymaps = import ./keymaps.nix;
  filetype.extension = {
    "templ" = "templ";
  };
  plugins = import ./plugins.nix;
  autoGroups = {
    yank_highlight = {
      clear = true;
    };
  };
  autoCmd = [
    {
      event = [ "TextYankPost" ];
      callback = {
        __raw = ''
          function()
          vim.highlight.on_yank()
          end
        '';
      };
      group = "yank_highlight";
      pattern = [ "*" ];
    }
  ];
  dependencies.ripgrep.enable = true;
}
