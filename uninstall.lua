local shell = require("shell")
local filesystem = require("filesystem")
local computer = require("computer")

if filesystem.exists("/lib/OCEngine") then
  print("[OCEngine] Removing old OCEngine folder and files")
  shell.execute('rm -r /lib/OCEngine')
  shell.execute('rm /bin/ocengine.lua')

  computer.shutdown(true)
end
