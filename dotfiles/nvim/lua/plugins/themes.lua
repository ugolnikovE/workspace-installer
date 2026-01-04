return {
  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup({
        theme = "dragon",
        terminalColors = true,
        styles = { comments = { italic = false }, keywords = { italic = false }, functions = { bold = false } },
        dimInactive = false,
      })
    end,
  },

  -- TokyoNight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        terminal_colors = true,
      })
    end,
  },

  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
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
    end,
  },

  -- Gruvbox
  {
    "morhetz/gruvbox",
    lazy = false,
    config = function()
      vim.g.gruvbox_contrast_dark = "hard"
    end,
  },

  -- OneDark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
      require("onedark").setup({ style = "warmer" })
      require("onedark").load()
    end,
  },

  -- Ayu
  {
    "Shatur/neovim-ayu",
    lazy = false,
    config = function()
      require("ayu").setup({
        mirage = true,
        overrides = {},
      })
      vim.cmd("colorscheme ayu")
    end,
  },
}
