local object = require("OCEngine/object")
local vec2 = require("OCEngine/vec2")

local Blob = {}
Blob.__index = Blob

function Blob.new (w,h)
  local result = {
    origin = vec2.new(),
    points = {
    },

    width = w,
    height = h
  }

  setmetatable(result, Blob)

  return result
end

setmetatable(Blob, {__index = object})

function Blob:random()
  self.origin.x = math.random(self.width)
  self.origin.y = math.random(self.height)
end

function Blob:draw(canvas)
  canvas:set(self.origin.x, self.origin.y, "X")
end

function Blob:delete()
end

return Blob
