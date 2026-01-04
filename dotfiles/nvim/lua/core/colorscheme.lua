local ok, ayu = pcall(require, "ayu")
if not ok then
        vim.notify("Ayu theme failed to load!", vim.log.levels.ERROR)
        return
end

ayu.setup({
        mirage = true,
        overrides = {},
})

vim.cmd("colorscheme ayu")
