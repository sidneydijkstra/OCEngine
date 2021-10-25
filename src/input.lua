local event = require("event")
local keyboard = require("keyboard")

local vec2 = require("OCEngine/vec2")

local Input = {
  charlist = {},
  key_down = {},
  key_up = {},
  key_press = {},
  touch_state = false,
  touch_position = vec2.new(),
  interval = 0.001
}

for i=32, 256 do
 Input.charlist[i] = utf8.char(i)
 Input.key_down[i] = false
 Input.key_up[i] = false
 Input.key_press[i] = false
end


function Input.update()
  for i=32, 256 do
   Input.key_down[i] = false
   Input.key_up[i] = false
  end

  Input.touch_state = false

  os.sleep(Input.interval)
end

function Input.forceEvent(case, callback)
  event.listen(case, callback)
end

function event_keydown(adress, char, code, playerName)
  Input.key_down[math.floor(code)] = true
  Input.key_press[math.floor(code)] = true
end

function event_keyup(adress, char, code, playerName)
  Input.key_up[math.floor(code)] = true
  Input.key_press[math.floor(code)] = false
end

function event_touch(_, adress, x, y, playerName)
  Input.touch_state = true
  Input.touch_position = vec2.new(x,y)
end

function Input.keyDown(char)
  code = string.byte(char)
  return Input.key_down[math.floor(code)]
end

function Input.keyUp(char)
  code = string.byte(char)
  return Input.key_up[math.floor(code)]
end

function Input.keyPress(char)
  code = string.byte(char)
  return Input.key_press[math.floor(code)]
end

function Input.alt()
  return keyboard.isAltDown()
end

function Input.ctrl()
  return keyboard.isControlDown()
end

function Input.shift()
  return keyboard.isShiftDown()
end

function Input.touch()
  return Input.touch_state, Input.touch_position
end

function Input.touchPosition()
  return Input.touch_position
end

event.listen("key_down", event_keydown)
event.listen("key_up", event_keyup)
event.listen("touch", event_touch)

return Input
