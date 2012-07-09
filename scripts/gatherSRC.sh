
A_ORIGIN=/Users/tnbeatty/Library/Developer/Xcode/DerivedData/STRABO-MultiRecorder-gcgqgkhpyagxhhfkdtquledulqjc/Build/Products/Debug-iphoneos/libSTRABO-MultiRecorder.a
H_ORIGIN=../STRABO-MultiRecorder/STRABO-MultiRecorder/*.h
STORYBOARD_ORIGIN=../STRABO-MultiRecorder/STRABO-MultiRecorder/STRMultiRecorderStoryboard.storyboard
SOURCE=../src

cp $A_ORIGIN $SOURCE
cp $H_ORIGIN $SOURCE
cp $STORYBOARD_ORIGIN $SOURCE

echo "Files coppied to the source folder."
