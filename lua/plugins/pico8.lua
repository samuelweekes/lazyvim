return {
  {
    "bakudankun/pico-8.vim",
    ft = "pico8",
    init = function()
      -- Disable the keymap that converts uppercase to glyphs
      vim.g.pico8_config = {
        use_keymap = 0,
      }
    end,
  },
}
