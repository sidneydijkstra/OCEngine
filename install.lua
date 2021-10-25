local shell = require("shell")
local filesystem = require("filesystem")

files = {
  "core.lua",
  "canvas.lua",
  "input.lua",
  "vec2.lua",
  "timer.lua",
  "object.lua",
  "square.lua",

  "uninstall.lua"
}

if filesystem.exists("/lib/OCEngine") then
  print("[OCEngine] Removing old OCEngine folder and files")
  shell.execute('rm -r /lib/OCEngine')
end

print("[OCEngine] Creating new OCEngine folder")
shell.execute('mkdir /lib/OCEngine')

for i, file in ipairs(files) do
  print(string.format("[OCEngine] %d/%d Downloading file %s", i, #files, file))
  shell.execute(string.format('wget "https://github.com/sidneydijkstra/OCEngine/blob/main/%s" "/lib/OCEngine/%s"', file, file))
end
