local gh = require("config.gh")

vim.pack.add({ gh("navarasu/onedark.nvim") })

require("onedark").setup({
  style = "warm",
  transparent = true,
  colors = {
    grey = "#8b8d91",
  },
})
require("onedark").load()
