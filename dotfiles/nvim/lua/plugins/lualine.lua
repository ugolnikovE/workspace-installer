return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = { modified = "[+]", readonly = "[-]" },
          },
        },
        lualine_x = {
          "encoding",
          "fileformat",
          {
            "filetype",
            fmt = function(type)
              return type or ""
            end,
          },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "fugitive", "nvim-tree" },
    })
  end,
}
