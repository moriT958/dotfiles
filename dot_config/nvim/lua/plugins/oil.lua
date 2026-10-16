local gh = require("config.gh")

vim.pack.add({
  gh("nvim-tree/nvim-web-devicons"),
  gh("stevearc/oil.nvim"),
  gh("refractalize/oil-git-status.nvim"),
})

require("oil").setup({
  columns = { "icon" },
  watch_for_changes = true,
  keymaps = {
    ["-"] = {
      callback = function()
        local git = require("oil.git")
        local current_dir = require("oil").get_current_dir()

        if not current_dir then
          return
        end

        current_dir = current_dir:gsub("/$", "") -- 末尾の / を削除

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
    is_hidden_file = function(name, _)
      return name:match("^%.") ~= nil
    end,
    natural_order = "fast",
    sort = {
      { "type", "asc" },
      { "name", "asc" },
    },
  },
  delete_to_trash = true,
  win_options = {
    signcolumn = "yes:2",
  },
})

require("oil-git-status").setup({
  symbols = {
    index = {
      ["!"] = "!",
      ["?"] = "+",
      ["A"] = "+",
      ["C"] = "+",
      ["D"] = "_",
      ["M"] = "~",
      ["R"] = "~",
      ["T"] = "~",
      ["U"] = "~",
      [" "] = " ",
    },
    working_tree = {
      ["!"] = "!",
      ["?"] = "+",
      ["A"] = "+",
      ["C"] = "+",
      ["D"] = "_",
      ["M"] = "~",
      ["R"] = "~",
      ["T"] = "~",
      ["U"] = "~",
      [" "] = " ",
    },
  },
})

vim.keymap.set("n", "-", function()
  vim.cmd("Oil")
end, { desc = "Open Oil" })
