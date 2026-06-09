local dir = vim.fn.stdpath("config") .. "/lua/plugins"
for _, file in ipairs(vim.fn.glob(dir .. "/*.lua", false, true)) do
  require("plugins." .. vim.fn.fnamemodify(file, ":t:r"))
end
