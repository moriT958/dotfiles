local gh = require("config.gh")

vim.pack.add({ gh("catppuccin/nvim") })

require("catppuccin").setup({
  transparent_background = true,
  default_integrations = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    neotree = true,
    treesitter = true,
  },
  custom_highlights = function(colors)
    return {
      LineNr = { fg = colors.overlay0 },
    }
  end,
})
vim.cmd.colorscheme("catppuccin-frappe")
-- vim.cmd.colorscheme("catppuccin-latte")
