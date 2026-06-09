vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require("oil").setup({
  columns = { "icon" },
  watch_for_changes = true,
  keymaps = {
    ["-"] = {
      callback = function()
        local git = require("oil.git")
        local current_dir = require("oil").get_current_dir()
        if not current_dir then return end
        current_dir = current_dir:gsub("/$", "")
        local git_root = git.get_root(current_dir)
        local root = (git_root or vim.fn.getcwd()):gsub("/$", "")
        if current_dir ~= root then
          require("oil.actions").parent.callback()
        end
      end,
      mode = "n",
      desc = "Navigate to parent",
    },
  },
  view_options = {
    show_hidden = true,
    is_hidden_file = function(name, _) return name:match("^%.") ~= nil end,
    natural_order = "fast",
    sort = { { "type", "asc" }, { "name", "asc" } },
  },
  delete_to_trash = true,
})

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil" })
