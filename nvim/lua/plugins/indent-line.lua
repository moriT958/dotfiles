return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup()

      -- Apply indent guide by Tab
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go", "make", "c" },
        callback = function()
          require("ibl").setup_buffer(0, { indent = { tab_char = "│" } })
        end,
      })
    end,
  },
}
