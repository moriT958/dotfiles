local gh = require("config.gh")

vim.pack.add({ gh("nvim-treesitter/nvim-treesitter-context") })

require("treesitter-context").setup()
