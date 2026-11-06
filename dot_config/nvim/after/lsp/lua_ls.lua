-- [[
-- nvim-lspconfig の設定を上書きする
-- ]]
return {
  settings = {
    Lua = {
      completion = { callSnippet = "Replace" },
    },
  },
}
