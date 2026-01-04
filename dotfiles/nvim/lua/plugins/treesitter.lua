return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local ok, tsconfigs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        vim.notify("nvim-treesitter failed to load! Check ':Lazy sync'", vim.log.levels.ERROR)
        return
      end

      tsconfigs.setup({
        ensure_installed = { "c", "cpp", "rust", "lua" },
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
      })

      vim.notify("nvim-treesitter loaded successfully!", vim.log.levels.INFO)
    end,
  },
}
