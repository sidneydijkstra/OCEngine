local component = require("component")
local event = require("event")
local term = require("term")

local Canvas = {}
Canvas.__index = Canvas
Canvas.blockChar = 219

function Canvas.new ()
  width, height = component.gpu.getResolution()
  background = 0x000000
  foreground = 0xFFFFFF
  local result = {
    canvasWidth = width,
    canvasHeight = height,
    oldWidth = width,
    oldHeight = height,

    canvasBackground = background,
    canvasForeground= foreground
  }
  setmetatable(result, Canvas)

  return result
end

function Canvas:foreground(color, palette)
  self.canvasForeground = color
  component.gpu.setForeground(color, palette or false)
end

function Canvas:background(color, palette)
  self.canvasBackground = color
  component.gpu.setBackground(color, palette or false)
end

function Canvas:set(x,y,string)
  component.gpu.set(x,y,string)
end

function Canvas:clear()
  term.clear()
end

function Canvas:clearArea(x,y,w,h) -- optional? term.clear()
  for px = x or 1, w or self.canvasWidth do
    for py = y or 1, w or self.canvasHeight do
      component.gpu.set(px,py," ")
    end
  end
end

function Canvas:resize(width, height)
  self.canvasWidth = width
  self.canvasHeight = height
  component.gpu.setResolution(self.canvasWidth, self.canvasHeight)
end

function Canvas:size()
  return canvasWidth, canvasHeight
end

function Canvas:delete()
  component.gpu.setForeground(0xFFFFFF, false)
  component.gpu.setBackground(0x000000, false)
  component.gpu.setResolution(self.oldWidth,self.oldHeight)
  self:clear()
end

return Canvas
