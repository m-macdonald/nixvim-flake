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
    action.__raw = ''
      function()
          require('conform').format({ async = true, lsp_format = 'fallback', range = nil })
      end
    '';
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
  # LSP Diagnostics
  {
    mode = "n";
    key = "<leader>tt";
    action = "<CMD>Trouble diagnostics toggle<CR>";
    options = {
      desc = "[T]oggle [T]rouble";
      silent = true;
    };
  }
  # Debugging
  {
    mode = "n";
    key = "<leader>b";
    action.__raw = "vim.cmd.DapToggleBreakpoint";
    options = {
      desc = "[B]reakpoint";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>gb";
    action.__raw = "require('dap').run_to_cursor";
    options = {
      desc = "Go to Cursor";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F1>";
    action.__raw = "vim.cmd.DapContinue";
    options = {
      desc = "Continue";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F2>";
    action.__raw = "vim.cmd.DapStepInto";
    options = {
      desc = "Step Into";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F3>";
    action.__raw = "vim.cmd.DapStepOver";
    options = {
      desc = "Step Over";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F4>";
    action.__raw = "vim.cmd.DapStepOut";
    options = {
      desc = "Step Out";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F5>";
    action.__raw = "vim.cmd.DapStepBack";
    options = {
      desc = "Step Back";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F12>";
    action.__raw = "require('dap').restart";
    options = {
      desc = "Restart Debugging";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>?";
    action.__raw = ''
      function()
          require("dapui").eval(nil, {enter = true})
      end
    '';
    options = {
      desc = "Evaluate variable under cursor";
      silent = true;
    };
  }
]
