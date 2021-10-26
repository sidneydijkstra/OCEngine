local CoreInitializer = require("OCEngine/core")
local Timer = require("OCEngine/timer")
local Snake = require("snake")
local Blob = require("blob")

local core = CoreInitializer.new()
local canvas = core:getCanvas()
local input = core:getInput()

timer = Timer.new()
timer:startTimer()

speed = 20
w = 40
h = 20

snake = Snake.new(20,10,w,h)
blob = Blob.new(w,h)
blob:random()

canvas:resize(w,h)

while core:run() do
  snake:input()

  currentTime = timer:time()
  if currentTime >= speed then
    state = snake:contains(blob)
    if not snake:move(state) then
      break
    end

    if state then
      blob:random()
    end

    timer:startTimer()
  end

  blob:draw(canvas)
  snake:draw(canvas)

  input:update()
end

canvas:resize(10,1)
canvas:set(1,1, "Game Over!")

os.sleep(2)

core:delete()
