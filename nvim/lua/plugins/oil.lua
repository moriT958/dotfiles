return {
  "stevearc/oil.nvim",
  opts = {
    columns = { "icon" },
    watch_for_changes = true,
    keymaps = {
      ["l"] = {
        callback = function()
          local oil = require("oil")
          local entry = oil.get_cursor_entry()
          if entry and entry.type == "directory" then
            oil.select()
          end
        end,
        mode = "n",
        desc = "Navigate into directory",
      },
      ["h"] = {
        callback = function()
          local git = require("oil.git")
          local current_dir = require("oil").get_current_dir()

          if not current_dir then
            return
          end

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
      ["<CR>"] = "actions.select",
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
  },
  dependencies = {
    { "nvim-tree/nvim-web-devicons", opts = {} },
  },
  lazy = false,

  vim.keymap.set("n", "h", function()
    vim.cmd("Oil")
  end, { desc = "Open Oil" }),
}
