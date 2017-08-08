local map_dbm = {}
local Z = {}

function Z.new()
  fh, err = io.open("dbm.data")
  if err then print("OOps no file data"); return; end
  while true do
    line = fh:read()
    if line == nil then break end
    table.insert(map_dbm, line)
  end
  fh:close()
  return Z
end

function Z.sorted_dbm()
  math.randomseed(os.clock()*1000000000000000)
  local seed = math.floor(math.random() * #map_dbm)
  if seed <= 0 then seed = 1 end
  return map_dbm[seed]
end

return setmetatable( Z, { __call = function(self) return self.new() end} )
