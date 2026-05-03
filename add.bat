@echo off
REM Switch console to UTF-8 so Korean input/output is written as UTF-8
chcp 65001 > nul
setlocal

REM Move to script's own directory (works even when double-clicked)
cd /d "%~dp0"

set "NAME=%~1"
if "%NAME%"=="" set /p "NAME=Enter your name: "

if "%NAME%"=="" (
  echo [Error] Name cannot be empty.
  pause
  exit /b 1
)

set /p "MESSAGE=Enter your message: "

if "%MESSAGE%"=="" (
  echo [Error] Message cannot be empty.
  pause
  exit /b 1
)

set "FILE=entries\%NAME%.md"

if exist "%FILE%" (
  echo [Warning] Already exists: %FILE%
  pause
  exit /b 1
)

REM Get current date/time
set "TODAY=%date:~0,10%"
set "NOW=%time:~0,5%"

REM 1) Create entry markdown file
> "%FILE%" (
  echo # %NAME%
  echo.
  echo - **GitHub**: @%NAME%
  echo - **Datetime**: %TODAY% %NOW%
  echo - **Message**: %MESSAGE%
)

REM 2) Append a line to guestbook.md (^| escapes the pipe character)
>> guestbook.md echo - %TODAY% %NOW% ^| %NAME% ^| %MESSAGE%

echo.
echo [OK] Created  %FILE%
echo [OK] Appended guestbook.md
echo.
echo Next steps:
echo   1. git add %FILE% guestbook.md
echo   2. git commit -m "add: %NAME%"
echo   3. git push origin your-branch
echo.
pause

endlocal