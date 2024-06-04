# snnipet

## 引数チェック

```batch
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
```

---

## 時刻取得

```batch
@echo off

call :SetDateTemplate
echo %OUTPUT%
exit /b

:SetDateTemplate
set HH=%TIME:~0,2%
set MM=%TIME:~3,2%
set SS=%TIME:~6,2%
set YYYYMMDD=%date:~-10,4%%date:~-5,2%%date:~-2,4%
set OUTPUT=%YYYYMMDD%-%HH%%MM%-%SS%
exit /b
```

---

## ダブルクォーテーション削除

```batch
@echo off

set arg="%1"
set DEFAULT=1
call :DeleteDoubleQuotation
set FLAG=%OUTPUT%

exit /b

@REM ============================
:DeleteDoubleQuotation
if %arg%=="" (
 set OUTPUT=%DEFAULT%
) else (
 set OUTPUT=%arg:"=%
 rem echo %OUTPUT%
)
exit /b
```

---

## コマンドの実行結果の取得

```batch
@echo off

setlocal ENABLEDELAYEDEXPANSION

FOR /F %%i in ('where explorer') do (
set RESULT_PATH=%%i
)
echo %RESULT_PATH%
exit /b
```

