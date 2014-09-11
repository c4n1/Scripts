
require 'win32ole'

file_system = WIN32OLE.new("Scripting.FileSystemObject")
drives = file_system.Drives
drives.each do |drive|
  puts "Available space: #{drive.AvailableSpace}"
  puts "Drive letter: #{drive.DriveLetter}"
  puts "Drive type: #{drive.DriveType}"
  puts "File system: #{drive.FileSystem}"
  puts "Is ready: #{drive.IsReady}"
  puts "Path: #{drive.Path}"
  puts "Root folder: #{drive.RootFolder}"
  puts "Serial number: #{drive.SerialNumber}"
  puts "Share name: #{drive.ShareName}"
  puts "Total size: #{drive.TotalSize}"
  puts "Volume name: #{drive.VolumeName}"
end

