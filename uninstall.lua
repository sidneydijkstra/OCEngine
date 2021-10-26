local shell = require("shell")
local filesystem = require("filesystem")
local computer = require("computer")

if filesystem.exists("/lib/OCEngine") then
  print("[OCEngine] Removing old OCEngine folder and files")
  shell.execute('rm -r /lib/OCEngine')
  shell.execute('rm /bin/ocengine.lua')

  if filesystem.exists("/home/snake") then
    shell.execute('rm -r /home/snake')
  end

  computer.shutdown(true)
end
