@echo off

set arg="%1"
set DEFAULT=0
call :CheckArg
echo %OUTPUT%
exit /b

:CheckArg
if %arg%=="" (
 set OUTPUT=%DEFAULT%
) else (
 set OUTPUT=%arg:"=%
)
exit /b