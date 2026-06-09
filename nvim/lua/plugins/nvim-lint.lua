vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

local lint = require("lint")

lint.linters_by_ft = {
  typescript      = { "eslint" },
  typescriptreact = { "eslint" },
  javascript      = { "eslint" },
  javascriptreact = { "eslint" },
  vue             = { "eslint" },
  astro           = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    if vim.opt_local.modifiable:get() then
      lint.try_lint(nil, { ignore_errors = true })
    end
  end,
})
