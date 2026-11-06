local gh = require("config.gh")

vim.pack.add({
  gh("nvim-tree/nvim-web-devicons"),
  gh("nvim-lualine/lualine.nvim"),
})

require("lualine").setup({
  sections = {
    lualine_c = {
      { "filename", path = 1 },
    },
  },
})
