return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false, 
  config = function()
    require("toggleterm").setup({
      size = 8,
      open_mapping = [[<C-t>]],
      direction = "horizontal",
      auto_scroll = true,
      shade_terminals = true,
      close_on_exit = true,
    })
  end,
}
