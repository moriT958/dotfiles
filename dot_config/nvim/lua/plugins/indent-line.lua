local gh = require("config.gh")

vim.pack.add({ gh("lukas-reineke/indent-blankline.nvim") })

require("ibl").setup()

-- Apply indent guide by Tab
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "make", "c" },
  callback = function()
    require("ibl").setup_buffer(0, { indent = { tab_char = "│" } })
  end,
})
