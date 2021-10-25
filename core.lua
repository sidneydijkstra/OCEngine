local component = require("component")
local event = require("event")

local Input = require("OCEngine/input")
local Canvas = require("OCEngine/canvas")

local Core = {}
Core.__index = Core

function Core.new ()
  local result = {
    canvas = Canvas.new(),
    input = Input,
    running = true
  }
  setmetatable(result, Core)

  return result
end

function Core:getCanvas()
  return self.canvas
end

function Core:getInput()
  return self.input
end


function Core:run()
  self.canvas:clear()

  if Input.keyPress("c") then
    self.canvas:delete()
    self.running = false
  end

  return self.running
end

function Core:delete()
  self.canvas:delete()
end

return Core
