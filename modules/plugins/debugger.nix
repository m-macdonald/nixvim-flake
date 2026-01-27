{pkgs, ...}: {
  dap = {
    enable = true;
    adapters = {
      executables = {
        coreclr = {
          command = "${pkgs.netcoredbg}";
          args = ["--interpreter=vscode"];
        };
      };
    };
    configurations = {
      "dotnet" = [
        {
          type = "coreclr";
          name = "launch - netcoredbg";
          request = "launch";
          program.__raw = ''
            function()
                return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
            end
          '';
        }
      ];
    };
  };
  dap-ui = {
    enable = true;
    luaConfig.post = ''
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
          dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
          dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
      end
      dap.listeners.before.even_exited.dapui_config = function()
          dapui.close()
      end
    '';
    settings = {};
  };
  # Adds Go debugging support
  dap-go = {
    enable = true;
  };
  # Adds C, C++, and Rust debugging support
  dap-lldb = {
    enable = true;
  };
  dap-virtual-text = {
    enable = true;
  };
}
