@echo off
setlocal enabledelayedexpansion

REM Get the current directory name
for %%f in (%cd%) do set current_dir=%%~nxf

REM Parameter -dg for delete git
echo %* | findstr /i " -dg " > nul
if %errorlevel% equ 0 (

    REM Check if .git directory exists and delete it if present
    if exist .git (
        rmdir /s /q .git
        del /q .gitignore
    )
) else (
    echo If you want to disconnect git - use the parameter -dg (e.g., initialize.bat -dg)
)

REM Replace import path for errorhandling in main.go with the current directory name
if exist main.go (
    owershell -Command "(Get-Content 'main.go') -replace '\"[^\"]*/errorhandling', '\"%current_dir%/errorhandling' | Set-Content 'main.go'"
    echo Import paths in main.go has been changed to '%current_dir%'.
)

REM Check if go.mod exists and delete it
if exist go.mod (
    del go.mod
)

REM Initialize the Go module with the current directory name
go mod init %current_dir%

endlocal
pause > nul