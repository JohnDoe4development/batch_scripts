@echo off

setlocal ENABLEDELAYEDEXPANSION

FOR /F %%i in ('where explorer') do (
set RESULT_PATH=%%i
)
echo %RESULT_PATH%
exit /b