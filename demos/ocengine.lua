local CoreInitializer = require("OCEngine/core")
local Timer = require("OCEngine/timer")

local core = CoreInitializer.new()
local canvas = core:getCanvas()
local input = core:getInput()

canvas:resize(8,2)
canvas:background(0xFF0000)

t = Timer.new()
t:startTimer()

while core:run() do
  time = t:time()

  if time > 100 then
    t:startTimer()
  end

  if time >= 0 and time <= 50 then
    canvas:set(1,1,"OCEngine")
    canvas:set(1,2,"enignECO")
    canvas:background(0xFF0000)
  end

  if time > 50 and time <= 100 then
    canvas:set(1,1,"enignECO")
    canvas:set(1,2,"OCEngine")
    canvas:background(0x00FF00)
  end

  input:update()
end

core:delete()
