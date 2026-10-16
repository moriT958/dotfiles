-- Highlight todo, notes, etc in comments
local gh = require("config.gh")

vim.pack.add({
  gh("nvim-lua/plenary.nvim"),
  gh("folke/todo-comments.nvim"),
})

require("todo-comments").setup({ signs = false })
