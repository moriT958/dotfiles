local gh = require("config.gh")

vim.pack.add({ gh("stevearc/conform.nvim") })

require("conform").setup({
  notify_on_error = false,

  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofmt" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    vue = { "prettier" },
    astro = { "prettier" },
    jsx = { "prettier" },
    tsx = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    yaml = { "prettier" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

vim.keymap.set("", "<leader>f", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })
