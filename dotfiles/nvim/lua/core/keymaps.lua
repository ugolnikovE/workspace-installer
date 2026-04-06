vim.g.mapleader = " "

-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

vim.keymap.set({"n", "v"}, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Save
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a")
