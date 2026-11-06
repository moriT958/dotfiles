local gh = require("config.gh")

vim.pack.add({
  gh("rafamadriz/friendly-snippets"),
  { src = gh("saghen/blink.cmp"), version = vim.version.range("1.*") },
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<C-l>"] = { "snippet_forward", "fallback" },
    ["<C-h>"] = { "snippet_backward", "fallback" },
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
  completion = {
    accept = { auto_brackets = { enabled = true } },
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
  },
})
