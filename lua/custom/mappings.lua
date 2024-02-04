local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dc"] = {
      function() require('dap').continue() end,
      "Debug Continue"
    },
    ["<leader>db"] = {
      function() require('dap').toggle_breakpoint() end,
      "Debug Breakpoint (Toggle)",
    },
    ["<leader>dn"] = {
      function() require('dap').step_over() end,
      "Debug Nextline (Step Over)",
    },
    ["<leader>di"] = {
      function() require('dap').step_into() end,
      "Debug Inside (Step Into)",
    },
    ["<leader>do"] = {
      function() require('dap').step_out() end,
      "Debug Outside (Step Out)",
    },
    ["<leader>dl"] = {
      function() require('dap').run_last() end,
      "Debug Last Run",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function () require("dap-go").debug_test() end,
      "Debug Go Test",
    },
    ["<leader>dgl"] = {
       function () require("dap-go").debug_last() end,
      "Debug Go Last test",
    },
  }
}

return M
