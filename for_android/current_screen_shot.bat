@echo off

cd %~dp0

set arg="%1"
set DEFAULT=1
call :CheckArg
set FLAG=%OUTPUT%

call :GetModelName
set MODEL_NAME=%OUTPUT%

set TODAY=screen_shot\%MODEL_NAME%_%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%
mkdir %TODAY%

set FILE_TIME=%time: =0%
set FILE_NAME=%date:~-10,4%%date:~-5,2%%date:~-2,4%_%FILE_TIME:~0,2%%FILE_TIME:~3,2%_%FILE_TIME:~6,2%
rem echo %FILE_NAME%

adb shell "screencap -p /sdcard/screen.png"
adb pull /sdcard/screen.png ./%TODAY%/screen_shot_%FILE_NAME%.png
adb shell "rm /sdcard/screen.png"

if %FLAG% == 1 (
  explorer %cd%\%TODAY%
)
exit /b

@REM ============================
:CheckArg
if %arg%=="" (
 set OUTPUT=%DEFAULT%
) else (
 set OUTPUT=%arg:"=%
)
exit /b

@REM ============================
:GetModelName
FOR /F %%i in ('adb shell getprop ro.product.model') do (
set OUTPUT=%%i
)
exit /b
