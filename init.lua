-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "love" },
      },
    },
  },
})
