return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      php = { "pint" },
      ruby = { "rubocop" },
      eruby = { "erb_formatter" },
    },
    formatters = {
      pint = {
        command = "vendor/bin/pint",
        args = { "--preset=laravel", "$FILENAME" },
        stdin = false,
      },
      rubocop = {
        command = "bundle",
        args = { "exec", "rubocop", "--autocorrect", "--stdin", "$FILENAME", "--stderr" },
        stdin = true,
      },
      erb_formatter = {
        command = "erb-formatter",
        args = { "--stdin" },
        stdin = true,
      },
    },
  },
}
