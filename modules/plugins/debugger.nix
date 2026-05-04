{pkgs, ...}: {
  dap = {
    enable = true;
    adapters.executables.coreclr = {
      command = "${pkgs.netcoredbg}";
      args = ["--interpreter=vscode"];
    };
    configurations.dotnet = [
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
    luaConfig.post = ''
      _G.smart_debug = function()
        local dap = require('dap')
        local ft = vim.bo.filetype
        local filename = vim.fn.expand('%:t')

        local test_patterns = {
          go  = '_test%.go$',
          cs  = '[Tt]ests?%.cs$',
          js  = '%.test%.js$',
          ts  = '%.test%.ts$',
          jsx = '%.test%.jsx$',
          tsx = '%.test%.tsx$',
        }

        local configs = dap.configurations[ft] or {}
        local pattern = test_patterns[ft]

        if pattern and filename:match(pattern) then
          for _, config in ipairs(configs) do
            if config.name:lower():match('test') then
              dap.run(config)
              return
            end
          end
        end

        dap.continue()
      end
    '';
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
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    '';
  };
  dap-go = {
    enable = true;
    luaConfig.post = ''
      vim.env.CGO_CFLAGS = "-O2"
    '';
  };
  dap-lldb.enable = true;
  dap-virtual-text.enable = true;
}
