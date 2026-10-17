-- [[ Plugin Manager (vim.pack) ]]
-- (:help vim.pack)
-- vim.pack is built into Neovim, no bootstrap step is needed.

-- Run build steps for plugins that need them after install/update.
-- (:help vim.pack-events)
local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ""
    local stdout = result.stdout or ""
    local output = stderr ~= "" and stderr or stdout
    if output == "" then
      output = "No output from build command."
    end
    vim.notify(("Build failed for %s:\n%s"):format(name, output), vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "telescope-fzf-native.nvim" and vim.fn.executable("make") == 1 then
      run_build(name, { "make" }, ev.data.path)
      return
    end

    if name == "nvim-treesitter" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
      return
    end
  end,
})

-- Order matters: color-theme sets the colorscheme before lualine's theme
-- auto-detection runs, and nvim-treesitter loads before nvim-treesitter-context.
local plugins = {
  "plugins.color-theme",
  "plugins.which-key",
  "plugins.gitsigins",
  "plugins.todo-comments",
  "plugins.indent-line",
  "plugins.autopairs",
  "plugins.lualine",
  "plugins.telescope",
  "plugins.nvim-lspconfig",
  "plugins.formatter",
  "plugins.lint",
  "plugins.blink-cmp",
  "plugins.nvim-treesitter",
  "plugins.nvim-treesitter-context",
  "plugins.lazydev",
  "plugins.outline",
  "plugins.oil",
  "plugins.debugger",
  "plugins.hello",
}

for _, plugin in ipairs(plugins) do
  require(plugin)
end
