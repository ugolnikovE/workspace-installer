local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- LSP
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- File browser
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  
  -- Tabs
  { "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  
  -- Terminal
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  
  -- StatusBar
  { "nvim-lualine/lualine.nvim" },

  -- Themes
  { "folke/tokyonight.nvim", priority = 1000 },
  { "rebelot/kanagawa.nvim", priority = 1000 },
  { "morhetz/gruvbox", priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "arcticicestudio/nord-vim", priority = 1000 },
  { "navarasu/onedark.nvim", priority = 1000 },
  { "Shatur/neovim-ayu", priority = 1000 },
})
