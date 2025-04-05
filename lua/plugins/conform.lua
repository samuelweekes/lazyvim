return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      php = { "pint" },
    },
    formatters = {
      pint = {
        command = "vendor/bin/pint",
        args = { "--preset=laravel", "$FILENAME" },
        stdin = false,
      },
    },
  },
}
