local gh = require("config.gh")

vim.pack.add({ gh("lewis6991/gitsigns.nvim") })

require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 0,
    virt_text_pos = "eol",
  },
})
