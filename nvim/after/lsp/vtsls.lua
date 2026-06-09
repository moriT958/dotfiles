local vtsls_ts_plugin_path = vim.fn.glob(
  vim.fn.expand("~/.local/share/mise/installs/npm-vue-typescript-plugin") .. "/**/@vue/typescript-plugin",
  false,
  true
)[1]

return {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vtsls_ts_plugin_path,
            languages = { "vue" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
    },
  },
}
