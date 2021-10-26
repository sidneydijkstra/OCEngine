local object = require("OCEngine/object")
local vec2 = require("OCEngine/vec2")
local input = require("OCEngine/input")

local Snake = {}
Snake.__index = Snake

function Snake.new (x,y,w,h)
  local result = {
    origin = vec2.new(0,0),
    points = {
      vec2.new(x,y),
      vec2.new(x,y-1),
      vec2.new(x,y-2)
    },
    direction = vec2.new(0,1),
    width = w,
    height = h
  }

  setmetatable(result, Snake)

  return result
end

setmetatable(Snake, {__index = object})

function Snake:input()
  if     input.keyPress("w") then
    self.direction = vec2.new(0,-1)
  elseif input.keyPress("s") then
    self.direction = vec2.new(0,1)
  elseif input.keyPress("a") then
    self.direction = vec2.new(-1,0)
  elseif input.keyPress("d") then
    self.direction = vec2.new(1,0)
  end
end

function Snake:move(append)
  nextPoint = self.points[1] + self.direction
  for i, point in ipairs(self.points) do
      if self.points[i].x <= 1 or self.points[i].x > self.width or self.points[i].y <= 1 or self.points[i].y > self.height then
        return false
      end

      oldPoint = self.points[i]
      self.points[i] = nextPoint
      nextPoint = oldPoint
  end

  for i, ipoint in ipairs(self.points) do
    for j, jpoint in ipairs(self.points) do
      if ipoint == jpoint and i ~= j then
        return false
      end
    end
  end

  if append then
    self.points[#self.points+1] = nextPoint
  end

  return true
end

function Snake:contains(blob)
  return self.points[1] == blob.origin
end

function Snake:draw(canvas)
  for _, point in ipairs(self.points) do
    canvas:set(self.origin.x + point.x, self.origin.y + point.y, "O")
  end
end

function Snake:delete()
end

return Snake
