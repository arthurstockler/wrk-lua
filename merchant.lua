M = {};

function M.new(init)
  local self = setmetatable({}, M)

  print("logging")
  self.value = init
  return self
end


return M;
