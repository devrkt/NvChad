local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function ()
      return require("custom.configs.treesitter")
    end
  },
  {
    "folke/trouble.nvim",
    config = true,
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
    },
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
    end,
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function ()
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function ()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
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
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = false,
      },
      formatters_by_ft = {
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        lua = { "stylua" },
        json = { "prettier" },
        yaml = { "prettier" },
        sh = { "shellcheck", "shfmt" },
        go = { "goimports-reviser", "golines", "gofmt" },
        java = { "google-java-format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        md = { "mdformat", "inject" },
        rust = { "rustfmt" },
        templ = { "templ" },
        ["*"] = { "codespell" },
      },
      formatters = {
        ["goimports-reviser"] = {
          prepend_args = { "--company-prefixes", "github.paypal.com" },
        },
      },
    },
  },
}
return plugins
