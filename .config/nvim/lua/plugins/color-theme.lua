local gh = require("config.gh")

vim.pack.add({ gh("navarasu/onedark.nvim") })

require("onedark").setup({
  style = "dark",
  transparent = true,
})
require("onedark").load()
