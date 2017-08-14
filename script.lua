require('random-payload')
require('rest')

local weight = 1

request = function()
  weight = weight + 1

  if weight % 10 == 0 then
    return new_order()
  end

  return list_order()
end
