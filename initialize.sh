#!/bin/bash

current_dir=$(basename "$PWD")

# Parameter -dg for delete git
if [[ " $* " == *" -dg "* ]]; then

    # Check if git is still there. This is just for disconnect from template git.
    # After this 
    if [ -d ".git" ]; then
        rm -rf .git
    fi
else
    echo "If you want to disconnect git - use the parameter -dg (./initialize.sh -dg)"
fi

# Replace improt path for errorhandling in main.go with the current directory name
if [ -f "main.go" ]; then
    sed -i "s|\"/errorhandling|\"$current_dir/errorhandling|g" main.go
    echo "Import paths in main.go has been changed to '$current_dir'."
fi

# Check if go.mod exists
if [ -f "go.mod" ]; then
    rm go.mod
fi

# Initialize the Go module with the current directory name
go mod init $current_dir