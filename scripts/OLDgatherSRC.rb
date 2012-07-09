#!/usr/bin/env ruby

require 'fileutils'

aOrigin = "/Users/tnbeatty/Library/Developer/Xcode/DerivedData/STRABO-MultiRecorder-gcgqgkhpyagxhhfkdtquledulqjc/Build/Products/Debug-iphoneos/libSTRABO-MultiRecorder.a"
aDestination = "../src"

FileUtils.cp aOrigin, aDestination

puts "Finished copying library file to the src folder."

hOrigin = "../STRABO-MultiRecorder/STRABO-MultiRecorder/*.h"
hDestination = "../src"

FileUtils.cp hOrigin, hDestination

puts "Finished copying header files to the src folder."
