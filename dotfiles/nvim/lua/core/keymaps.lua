vim.g.mapleader = " "

-- File explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

-- Clipboard
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("i", "<C-v>", '<Esc>"+pa')

-- Undo
vim.keymap.set({ "n", "v" }, "<C-z>", "u", { silent = true })
vim.keymap.set("i", "<C-z>", "<C-o>u", { silent = true })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Save
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a")
