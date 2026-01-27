{
  blink-cmp = {
    enable = true;
    settings = {
      completion = {
        menu = {
          enabled = true;
        };
        documentation.auto_show = true;
        accept = {
          auto_brackets.enabled = false;
        };
        ghost_text.enabled = true;
        list.cycle = {
          from_top = true;
          from_bottom = true;
        };
      };
      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
      };
      keymap = {
        "<Esc>" = [
          "cancel"
          "fallback"
        ];
        "<C-y>" = [
          "accept"
          "fallback"
        ];
        "<C-space>" = [
          "show_documentation"
          "hide_documentation"
        ];
        "<C-Up>" = [
          "scroll_documentation_up"
        ];
        "<C-Down>" = [
          "scroll_documentation_down"
        ];
        "<Tab>" = [
          "select_next"
          "fallback"
        ];
        "<C-Tab>" = [
          "select_prev"
          "fallback"
        ];
      };
    };
  };
}
