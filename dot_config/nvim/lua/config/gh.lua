-- Because most plugins are hosted on GitHub, use this helper
-- to have less repetition in each plugins/*.lua file.
---@param repo string
---@return string
return function(repo)
  return "https://github.com/" .. repo
end
