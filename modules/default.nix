{
    globals = {
        mapleader = " ";
        maplocalleader = " ";
    };
    opts = {
        hlsearch = false;
        number = true;
        relativenumber = true;
        termguicolors = true;
        clipboard = "unnamedplus";
        breakindent = true;
        undofile = true;

        # Case insensitive searching unless /C or capital in search
        ignorecase = true;
        smartcase = true;

        tabstop = 4;
        shiftwidth = 4;
        expandtab = true;
        smartindent = true;

        signcolumn = "yes";

        updatetime = 250;
        timeout = true;
        timeoutlen = 300;

        # Set completeopt to have a better completion experience
        completeopt = "menuone,noselect";
    };
    colorschemes.catppuccin.enable = true;
    keymaps = import ./keymaps.nix;
    plugins = import ./plugins.nix;
    autoGroups = {
        yank_highlight = { clear = true; };
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
}

