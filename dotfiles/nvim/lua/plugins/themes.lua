-- Kanagawa
require("kanagawa").setup({
  theme = "dragon",
  terminalColors = true,
  styles = { comments = { italic = false }, keywords = { italic = false }, functions = { bold = false } },
  dimInactive = false,
})

-- TokyoNight
require("tokyonight").setup({
  style = "storm",
  terminal_colors = true,
})

-- Catppuccin
require("catppuccin").setup({
  flavour = "mocha",
  background = { 
      light = "latte",
      dark = "mocha",
  },
  transparent_background = false,
  term_colors = true,
  styles = {
      comments = { "italic" },
      keywords = { "italic" },
      functions = { "bold" },
      variables = {},
  },
  integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
  },
})

-- Gruvbox
vim.g.gruvbox_contrast_dark = "hard"


-- OneDark
require("onedark").setup({ style = "warmer" })

-- Ayu
require("ayu").setup({
  mirage = true,
  overrides = {},
})

-- Choose autoload:
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme nord")
-- require("onedark").load()
vim.cmd("colorscheme ayu")
