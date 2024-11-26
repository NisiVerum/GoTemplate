#!/bin/bash

#Path to build directory
build_folder="build"

# delete all files in subdirectories
echo "Delete existing files in..."
for subfolder in "$build_folder"/*/; do
    if [ -d "$subfolder" ]; then
        echo "... $subfolder"
        rm -rf "$subfolder"/*
    fi
done

echo "Start building for..."
# build for Windows 64-bit
echo "... Windows 64-bit..."
GOOS=windows GOARCH=amd64 go build -o build/Windows/NetworkScanner.exe main.go
# build for Windows 32-bit
echo "... Windows 32-bit..."
GOOS=windows GOARCH=386 go build -o build/Windows/NetworkScanner.exe main.go
# build for Linux 64-bit
echo "... Linux 64-bit..."
GOOS=linux GOARCH=amd64 go build -o build/Linux/NetworkScanner main.go
# build for Linux 32-bit
echo "... Linux 32-bit..."
GOOS=linux GOARCH=386 go build -o build/Linux/NetworkScanner main.go
# build for MacOS 64-bit
echo "... MacOS 64-bit..."
GOOS=darwin GOARCH=amd64 go build -o build/MacOS/NetworkScanner main.go

echo "Build process completed."