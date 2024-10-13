-- Return a table containing the plugin specifications
return {
  -- Ensure `mason-nvim-dap` is installed along with its dependencies
  {
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      -- DAP adapter configuration for PHP
      local dap = require('dap')

      dap.adapters.php = {
        type = 'executable',
        command = 'php-debug-adapter', -- Mason-installed adapter
      }

      dap.configurations.php = {
        {
          type = 'php',
          request = 'launch',
          name = 'Listen for Xdebug',
          port = 9003, -- Match your Xdebug port
          -- pathMappings = {
          --   ["/var/www/html"] = "${workspaceFolder}", -- Optional, adjust if needed (for remote)
          -- },
        },
      }
    end,
  },
}
