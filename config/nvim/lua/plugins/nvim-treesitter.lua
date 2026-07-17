local gh = require("config.gh")

vim.pack.add({ { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" } })

local parsers = {
  "astro",
  "c",
  "cpp",
  "go",
  "html",
  "lua",
  "ruby",
  "typescript",
  "typst",
  "vue",
}
require("nvim-treesitter").install(parsers)

---@param buf integer
---@param language string
local function treesitter_try_attach(buf, language)
  if not vim.treesitter.language.add(language) then
    return
  end
  vim.treesitter.start(buf, language)

  local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil
  if has_indent_query then
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

local available_parsers = require("nvim-treesitter").get_available()
vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local buf, filetype = ev.buf, ev.match

    local language = vim.treesitter.language.get_lang(filetype)
    if not language then
      return
    end

    local installed_parsers = require("nvim-treesitter").get_installed("parsers")

    if vim.tbl_contains(installed_parsers, language) then
      treesitter_try_attach(buf, language)
    elseif vim.tbl_contains(available_parsers, language) then
      require("nvim-treesitter").install(language):await(function()
        treesitter_try_attach(buf, language)
      end)
    else
      treesitter_try_attach(buf, language)
    end
  end,
})
