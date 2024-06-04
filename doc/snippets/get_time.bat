@echo off

call :GetDateTemplate
echo %OUTPUT%
exit /b

:GetDateTemplate
set HH=%TIME:~0,2%
set MM=%TIME:~3,2%
set SS=%TIME:~6,2%
set YYYYMMDD=%date:~-10,4%%date:~-5,2%%date:~-2,4%
set OUTPUT=%YYYYMMDD%-%HH%%MM%-%SS%
exit /b
