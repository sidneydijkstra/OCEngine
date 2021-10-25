local shell = require("shell")
local filesystem = require("filesystem")
local computer = require("computer")

files = {
  "core.lua",
  "canvas.lua",
  "input.lua",
  "vec2.lua",
  "timer.lua",
  "object.lua",
  "square.lua"
}

if filesystem.exists("/lib/OCEngine") then
  print("[OCEngine] Removing old OCEngine folder and files")
  shell.execute('rm -r /lib/OCEngine')
end

print("[OCEngine] Creating new OCEngine folder")
shell.execute('mkdir /lib/OCEngine')

for i, file in ipairs(files) do
  print(string.format("[OCEngine] %d/%d Downloading file %s", i, #files, file))
  shell.execute(string.format('wget -fq "https://raw.githubusercontent.com/sidneydijkstra/OCEngine/main/src/%s" "/lib/OCEngine/%s"', file, file))
end


print("[OCEngine] Downloading uninstall file uninstall.lua")
shell.execute('wget -fq "https://raw.githubusercontent.com/sidneydijkstra/OCEngine/main/uninstall.lua" "/lib/OCEngine/uninstall.lua"')

print("[OCEngine] Downloading demo file ocengine.lua")
shell.execute('wget -fq "https://raw.githubusercontent.com/sidneydijkstra/OCEngine/main/demos/ocengine.lua" "/bin/ocengine.lua"')

computer.shutdown(true)
