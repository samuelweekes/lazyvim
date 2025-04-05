return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true,
  keys = {
    { "<leader>cg", function() require("neogen").generate() end, desc = "Generate Docblock" },
  },
}
