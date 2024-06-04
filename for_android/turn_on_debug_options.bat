@echo off

rem スリープモードにしない
adb shell settings put global stay_on_while_plugged_in 7
rem adb shell settings put global stay_on_while_plugged_in 0

rem タップの表示
adb shell settings put system show_touches 1
rem adb shell settings put system show_touches 0

rem ポインタの位置の表示
adb shell settings put system pointer_location 1
rem adb shell settings put system pointer_location 0
