@echo off

REM Path to build directory
set build_folder=build
for %%f in (%cd%) do set current_dir=%%~nxf

REM Delete existing files in subdirectories
echo Delete existing files in...
for /d %%i in (%build_folder%\*) do (
    if exist "%%i" (
        echo ... %%i
        del /q "%%i\*"
    )
)

echo Start building for...

REM Build for Windows 64-bit
echo ... for Windows 64-bit...
set GOOS=windows
set GOARCH=amd64
go build -o build\Windows\x64\%current_dir%.exe main.go

REM Build for Windows 32-bit
echo ... Windows 32-bit...
set GOOS=windows
set GOARCH=386
go build -o build\Windows\x86\%current_dir%.exe main.go

REM Build for Linux 64-bit
echo ... for Linux 64-bit...
set GOOS=linux
set GOARCH=amd64
go build -o build\Linux\x64\%current_dir% main.go

REM Build for Linux 32-bit
echo ... for Linux 32-bit...
set GOOS=linux
set GOARCH=386
go build -o build\Linux\x86\%current_dir% main.go

REM Build for MacOS 64-bit
echo ... for MacOS 64-bit...
set GOOS=darwin
set GOARCH=amd64
go build -o build\MacOS\x64\%current_dir% main.go

echo Build process completed.

pause>NUL