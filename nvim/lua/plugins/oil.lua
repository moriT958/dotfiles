return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = true,
      is_hidden_file = function(name, bufnr)
        local m = name:match("^%.")
        return m ~= nil
      end,
      is_always_hidden = function(name, bufnr)
        return false
      end,
      natural_order = "fast",
      case_insensitive = false,
      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
      highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
        return nil
      end,
    },
  },
  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
  },
  lazy = false,

  vim.keymap.set("n", "-", function()
    if vim.bo.filetype ~= "oil" then
      vim.cmd("Oil")
    end
  end, { desc = "Open Oil" }),
}
