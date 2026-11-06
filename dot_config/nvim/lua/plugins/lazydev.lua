local gh = require("config.gh")

vim.pack.add({ gh("folke/lazydev.nvim") })

require("lazydev").setup({
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
  },
})
