local shell = require("shell")
local filesystem = require("filesystem")

-- Normal download

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

-- Demo donwload!

demos = {
  "game.lua",
  "snake.lua",
  "blob.lua",
}

local answer
repeat
   io.write("[OCEngine] Download demo snake game (y/n)? ")
   io.flush()
   answer=io.read()
until (answer=="y" or answer=="n")

if answer == "y" then
  shell.execute('mkdir /home/snake')
  for i, demo in ipairs(demos) do
    print(string.format("[OCEngine] %d/%d Downloading file %s", i, #demos, demo))
    shell.execute(string.format('wget -fq "https://raw.githubusercontent.com/sidneydijkstra/OCEngine/main/demos/snake/%s" "/home/snake/%s"', demo, demo))
  end
end
