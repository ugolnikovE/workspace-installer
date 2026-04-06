vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp' },
  root_markers = { 'compile_commands.json', 'Makefile', '.git' },
})

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.git' },
})

vim.lsp.config('bashls', {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'bash' },
  root_markers = { '.git' },
})

vim.lsp.enable({ 'clangd', 'lua_ls', 'bashls' })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok then
      local capabilities = cmp_lsp.default_capabilities()
      vim.lsp.config('*', { capabilities = capabilities })
    end
  end,
  once = true,
})
