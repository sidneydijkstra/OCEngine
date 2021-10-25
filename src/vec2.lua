
local Vec2 = {}
Vec2.__index = Vec2

-- operation overloader for +
Vec2.__add = function (v1, v2)
  return Vec2.new(v1.x + v2.x, v1.y + v2.y)
end

-- operation overloader for -
Vec2.__sub = function (v1, v2)
  return Vec2.new(v1.x - v2.x, v1.y - v2.y)
end

-- operation overloader for * scalar
Vec2.__mul = function (v1, s1)
  local s = tonumber(s1)
  if s then
    return Vec2.new(v1.x * s, v1.y * s)
  else
    error("[vector2 error] you can only do 'mul' operations with v1 -> Vec2 and s1 -> number")
  end
end

-- operation overloader for / scalar
Vec2.__div = function (v1, s1)
  local s = tonumber(s1)
  if s then
    return Vec2.new(v1.x / s, v1.y / s)
  else
    error("[vector2 error] you can only do 'div' operations with v1 -> Vec2 and s1 -> number")
  end
end

-- operation overloader for ==
Vec2.__eq = function(v1, v2)
  return v1.x == v2.x and v1.y == v2.y
end

function Vec2.new (x,y)
  local result = {
    x = x or 0,
    y = y or 0
  }
  setmetatable(result, Vec2)

  return result
end

-- operation overloader for tostring(e)
Vec2.__tostring = function (v1)
  return string.format("%f, %f", v1.x, v1.y)
end

function Vec2:copy()
  return Vec2.new(self.x, self.y)
end

function Vec2:print()
  print(string.format("%f, %f", self.x, self.y))
end

function Vec2:delete()
end

return Vec2
