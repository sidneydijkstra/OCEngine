local object = require("OCEngine/object")
local vec2 = require("OCEngine/vec2")

local Square = {}
Square.__index = Square

function Square.new (size, center)
  local result = {
      size = size,
      center = center or false
  }
  setmetatable(result, Square)

  return result
end

setmetatable(Square, {__index = object})

function Square:draw(canvas)
  originX = self.origin.x
  originY = self.origin.y

  if self.center then
    originX = originX - math.floor(self.size/2)
    originY = originY - math.floor(self.size/2)
  end

  for x = 0, self.size do
    for y = 0, self.size do
      canvas:set(originX + x, originY + y, "O")
    end
  end
end

function Square:delete()
end

return Square
