vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  formatters_by_ft = {
    typescript      = { "prettier", stop_after_first = true },
    typescriptreact = { "prettier", stop_after_first = true },
    javascript      = { "prettier", stop_after_first = true },
    javascriptreact = { "prettier", stop_after_first = true },
    vue             = { "prettier", stop_after_first = true },
    astro           = { "prettier", stop_after_first = true },
    css             = { "prettier", stop_after_first = true },
    json            = { "prettier", stop_after_first = true },
    markdown        = { "prettier", stop_after_first = true },
    go              = { "gofmt" },
    lua             = { "stylua" },
  },
})

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = false, lsp_format = "fallback" })
end, { desc = "[F]ormat" })
