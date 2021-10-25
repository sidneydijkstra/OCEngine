
local Timer = {}
Timer.__index = Timer

function Timer.new ()
  local result = {
    beginTime = 0,
    endTime = 0
  }
  setmetatable(result, Timer)

  return result
end

function Timer:startTimer()
  self.beginTime = os.time()
end

function Timer:time()
  return os.time() - self.beginTime
end

function Timer:endTimer()
  self.endTime = os.time()
end

return Timer
