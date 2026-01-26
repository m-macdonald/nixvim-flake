[
  {
    mode = [
      "n"
      "v"
    ];
    key = "<Space>";
    action = "<Nop>";
    options = {
      silent = true;
    };
  }
  # Open Mini.files
  {
    mode = "n";
    key = "-";
    action = "<Cmd>lua require('mini.files').open()<CR>";
    options = {
      silent = true;
      desc = "Open [F]ile [V]iewer";
    };
  }
  # Stay in visual mode when tabbing
  {
    mode = "v";
    key = "<S-Tab>";
    action = "<gv";
    options = {
      silent = true;
    };
  }
  {
    mode = "v";
    key = "<Tab>";
    action = ">gv";
    options = {
      silent = true;
    };
  }
  # Split current buffer
  {
    mode = "n";
    key = "<leader>sb";
    action = "<C-w>s";
    options = {
      desc = "[S]plit [B]uffer";
      silent = true;
    };
  }
  # Navigate split buffers
  {
    mode = "n";
    key = "<C-n>";
    action = "<C-w>h";
    options = {
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<C-e>";
    action = "<C-w>j";
    options = {
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<C-i>";
    action = "<C-w>k";
    options = {
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<C-o>";
    action = "<C-w>l";
    options = {
      silent = true;
    };
  }
  # Formatting
  {
    mode = "n";
    key = "<leader>fb";
    action.__raw = "vim.lsp.buf.format";
    options = {
      desc = "[F]ormat [B]uffer";
      silent = true;
    };
  }
  # Git
  {
    mode = "n";
    key = "<leader>gs";
    action.__raw = "vim.cmd.Git";
    options = {
      desc = "[G]it [S]tatus";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>tt";
    action.__raw = "vim.cmd.TroubleToggle";
    options = {
      desc = "[T]oggle [T]rouble";
      silent = true;
    };
  }
]
