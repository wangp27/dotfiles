local dap, dapui = require 'dap', require 'dapui'
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

-- ui
-- dapui.setup({
--     layouts = {
--         {
--             position = "left",
--             size = 0.4,
--             elements = {
--                 {
--                     id = "stacks",
--                     size = 0.2,
--                 },
--                 {
--                     id = "scopes",
--                     size = 0.5,
--                 },
--                 {
--                     id = "breakpoints",
--                     size = 0.15,
--                 },
--                 {
--                     id = "watches",
--                     size = 0.15,
--                 },
--             },
--             position = "bottom",
--             size = 0.2,
--             elements = {
--                 {
--                     id = "repl",
--                     size = 0.3,
--                 },
--                 {
--                     id = "console",
--                     size = 0.7,
--                 },
--             }
--         }
--     }
-- })

-- breakpoints icons
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpointCondition', linehl = '', numhl = 'DapBreakpointCondition' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = '', numhl = 'DapStopped' })
-- dap
vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Toggle DAP UI' })
vim.keymap.set('n', '<leader>dr', require('dap').continue, { desc = 'Continue DAP' })
vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint, { desc = 'Toggle DAP Breakpoint' })
vim.keymap.set('n', '<leader>ds', require('dap').step_into, { desc = 'DAP Step Into' })
vim.keymap.set('n', '<leader>dn', require('dap').step_over, { desc = 'DAP Step Over' })
vim.keymap.set('n', '<leader>dl', require('dap').step_out, { desc = 'DAP Step Out' })
vim.keymap.set('n', '<leader>dp', require('dap').pause, { desc = 'DAP Pause' })
vim.keymap.set('n', '<leader>de', require('dap').terminate, { desc = 'DAP Terminate' })
--  vim key map for condition breakpoint
vim.keymap.set('n', '<leader>dB', function()
    local condition = vim.fn.input('Breakpoint condition: ')
    require('dap').set_breakpoint(condition)
end, { desc = 'DAP Set Conditional Breakpoint' })

-- key map to delete all breakpoints
vim.keymap.set('n', '<leader>dD', function()
    require('dap').clear_breakpoints()
    print("All breakpoints cleared")
end, { desc = 'DAP Clear All Breakpoints' })

dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb",
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = true,
  },
  {
    name = "Select and attach to process",
    type = "codelldb",
    request = "attach",
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
       local name = vim.fn.input('Executable name (filter): ')
       return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = '${workspaceFolder}'
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'codelldb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  },
}
