-- Neovim entry point

require("core.lazy")
require("core.options")
require("core.keymaps")

require("plugins.lsp")
require("plugins.cmp")
require("plugins.treesitter")
require("plugins.nvim-tree")
require("plugins.toggleterm")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.themes")