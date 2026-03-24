return {
  "github/copilot.vim",
  lazy = false,

  config = function()
    local is_enabled = false
    vim.cmd("Copilot disable")

    vim.keymap.set("n", "<leader>tc", function()
      if is_enabled then
        vim.cmd("Copilot disable")
        is_enabled = false
        vim.notify("Copilot disabled", vim.log.levels.INFO)
      else
        vim.cmd("Copilot enable")
        is_enabled = true
        vim.notify("Copilot enabled", vim.log.levels.INFO)
      end
    end, { desc = "[T]oggle [C]opilot" })
  end,
}
