@echo off

REM Get the current directory name
for %%F in ("%CD%") do set "current_dir=%%~nxF"

REM Parameter -dg for delete git
echo %* | findstr /c:"-dg" > nul
if not errorlevel 1 (

    REM Check if .git exists, and if so, delete it.
    REM This is just for disconnecting from the template git.
    if exist ".git" (
        rmdir /s /q .git
    )
) else (
    echo If you want to disconnect git - use the parameter -dg (e.g., initialize.bat -dg)
)

REM Check if go.mod exists
if exist "go.mod" (
    del go.mod
)

REM Initialize the Go module with the current directory name
go mod init %current_dir%