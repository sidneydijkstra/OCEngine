local shell = require("shell")
local filesystem = require("filesystem")

if filesystem.exists("/lib/OCEngine") then
  print("[OCEngine] Removing old OCEngine folder and files")
  shell.execute('rm -r /lib/OCEngine')
  shell.execute('rm /bin/ocengine.lua')
end
