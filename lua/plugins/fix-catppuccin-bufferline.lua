return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup()
      -- Monkey-patch to fix LazyVim's outdated call
      local bufferline_integration = require("catppuccin.groups.integrations.bufferline")
      bufferline_integration.get = bufferline_integration.get_theme
    end,
  },
}
