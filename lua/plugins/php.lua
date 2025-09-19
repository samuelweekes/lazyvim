return {
  -- Use the LazyExtra defaults for php
  { import = "lazyvim.plugins.extras.lang.php" },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- Remove phpcs from the default installs
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return not vim.tbl_contains({ "phpcs", "php-cs-fixer" }, tool)
      end, opts.ensure_installed or {})

      -- Ensure pint and php-debug-adapter are default installs
      vim.list_extend(opts.ensure_installed, { "pint", "php-debug-adapter" })
    end,
  },

  -- Set Pint as our default PHP formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "pint" },
      },
    },
  },

  -- Remove phpcs from linting, keep only intelephense diagnostics
  -- intelephense is used over phpactor in config/options.lua
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = {}, -- Remove phpcs linting
      },
    },
  },
}
