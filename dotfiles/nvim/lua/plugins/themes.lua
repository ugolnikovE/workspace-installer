return {
-- Ayu
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
	mirage = true,
      })
      --vim.cmd("colorscheme ayu")
    end,
  },
  
-- Oxocarbon
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.opt.background = "dark"
      vim.cmd.colorscheme("oxocarbon")
    end,
  },

-- Poimandres
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
  },

-- Moonfly
  {
    "bluz71/vim-moonfly-colors",
    lazy = false,
  },

-- Nightfox
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
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
	term_colors = false,
	styles = {
          comments = { "italic" },
	  keywords = { "italic" },
	  functions = { "bold" },
	  variables = { },
	},
	integrations = {
          cmp = true,
	  gitsigns = true,
	  telescope = true,
	  treesitter = true,
	},
      })
    end,
  }
}


