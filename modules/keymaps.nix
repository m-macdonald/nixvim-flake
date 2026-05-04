[
  {
    mode = ["n" "v"];
    key = "<Space>";
    action = "<Nop>";
    options.silent = true;
  }
  # File explorer
  {
    mode = "n";
    key = "-";
    action = "<Cmd>lua require('mini.files').open()<CR>";
    options = {
      silent = true;
      desc = "Open File Explorer";
    };
  }
  # Visual indent
  {
    mode = "v";
    key = "<S-Tab>";
    action = "<gv";
    options.silent = true;
  }
  {
    mode = "v";
    key = "<Tab>";
    action = ">gv";
    options.silent = true;
  }
  # Buffer splits
  {
    mode = "n";
    key = "<leader>bh";
    action = "<C-w>s";
    options = {
      desc = "[B]uffer Split [H]orizontal";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>bv";
    action = "<C-w>v";
    options = {
      desc = "[B]uffer Split [V]ertical";
      silent = true;
    };
  }
  # Window navigation
  {
    mode = "n";
    key = "<C-n>";
    action = "<C-w>h";
    options.silent = true;
  }
  {
    mode = "n";
    key = "<C-e>";
    action = "<C-w>j";
    options.silent = true;
  }
  {
    mode = "n";
    key = "<C-i>";
    action = "<C-w>k";
    options.silent = true;
  }
  {
    mode = "n";
    key = "<C-o>";
    action = "<C-w>l";
    options.silent = true;
  }
  # Format buffer
  {
    mode = "n";
    key = "<leader>bf";
    action.__raw = ''
      function()
        require('conform').format({ async = true, lsp_format = 'fallback' })
      end
    '';
    options = {
      desc = "[B]buffer [F]ormat";
      silent = true;
    };
  }
  # Git
  {
    mode = "n";
    key = "<leader>gg";
    action = "<cmd>LazyGit<cr>";
    options = {
      desc = "[G]it [G]ui";
      silent = true;
    };
  }
  # Trouble
  {
    mode = "n";
    key = "<leader>tt";
    action = "<CMD>Trouble diagnostics toggle<CR>";
    options = {
      desc = "[T]oggle [T]rouble";
      silent = true;
    };
  }
  # Marks
  {
    mode = "n";
    key = "<leader>ml";
    action.__raw = "require('telescope.builtin').marks";
    options = {
      desc = "[M]arks [L]ist";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>md";
    action.__raw = "require('marks').delete_line";
    options = {
      desc = "[M]arks [D]elete";
      silent = true;
    };
  }
  # Debug
  {
    mode = "n";
    key = "<leader>db";
    action.__raw = "vim.cmd.DapToggleBreakpoint";
    options = {
      desc = "[D]ebug [B]reakpoint";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>dc";
    action.__raw = "require('dap').run_to_cursor";
    options = {
      desc = "[D]ebug Run to [C]ursor";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F1>";
    action.__raw = "_G.smart_debug";
    options = {
      desc = "Debug: Start";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F2>";
    action.__raw = "vim.cmd.DapStepInto";
    options = {
      desc = "Debug: Step Into";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F3>";
    action.__raw = "vim.cmd.DapStepOver";
    options = {
      desc = "Debug: Step Over";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F4>";
    action.__raw = "vim.cmd.DapStepOut";
    options = {
      desc = "Debug: Step Out";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F5>";
    action.__raw = "vim.cmd.DapStepBack";
    options = {
      desc = "Debug: Step Back";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<F12>";
    action.__raw = "require('dap').restart";
    options = {
      desc = "Debug: Restart";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>de";
    action.__raw = ''
      function()
        require("dapui").eval(nil, { enter = true })
      end
    '';
    options = {
      desc = "[D]ebug [E]valuate Expression";
      silent = true;
    };
  }
]
