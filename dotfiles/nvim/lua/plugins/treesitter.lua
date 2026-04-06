return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "c", "cpp", "rust", "lua", "bash" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
