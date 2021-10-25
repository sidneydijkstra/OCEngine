local vec2 = require("OCEngine/vec2")

local Object = {}
Object.__index = Object

function Object.new ()
  local result = {
    origin = vec2.new(),
    points = {
    }
  }
  setmetatable(result, Object)

  return result
end

function Object:draw(canvas)
  for point in pairs(self.points) do
    canvas:set(self.origin.x + point.x, self.origin.y + point.y, "O")
  end
end

function Object:delete()
end

return Object
