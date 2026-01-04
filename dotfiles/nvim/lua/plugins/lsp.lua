return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local ok, lspconfig = pcall(require, "lspconfig")
      if not ok then
        vim.notify("nvim-lspconfig failed to load!", vim.log.levels.ERROR)
        return
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = { "clangd", "rust_analyzer", "lua_ls" }

      for _, server in ipairs(servers) do
        if lspconfig[server] then
          lspconfig[server].setup({ capabilities = capabilities })
        else
          vim.notify("Server "..server.." not found!", vim.log.levels.WARN)
        end
      end
    end,
  },
}
