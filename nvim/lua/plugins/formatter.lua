return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,

    -- ft => filetype (:echo &filetype)
    formatters_by_ft = {
      lua = { "stylua" },
      python = function(bufnr)
        if require("conform").get_formatter_info("ruff_format", bufnr).available then
          return { "ruff_format" }
        else
          return { "isort", "black" }
        end
      end,
      java = { "google-java-format" },
      html = { "prettierd", "prettier", stop_after_first = true },
      css = { "biome" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      astro = { "prettierd", "prettier", stop_after_first = true },
      jsx = { "prettierd", "prettier", stop_after_first = true },
      tsx = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      sql = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "markdownlint", "prettier" },
      go = { "goimports", "gofmt" },
      toml = { "pyproject-fmt" },
      zsh = { "shfmt" },
      ruby = { "rubocop" },
      haskell = { "ormolu" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
