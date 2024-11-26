# Table of Contents

- [GoTemplate](#gotemplate)
  - [Things to do after getting GoTemplate](#things-to-do-after-getting-gotemplate)
    - [Linux/MacOS](#linuxmacos)
    - [Windows](#windows)
  - [Build](#build)
- [errorhandling package template](#errorhandling-package-template)
  - [Overview](#overview)
  - [Features](#features)
  - [Installation](#installation)
  - [ErrorDetails Struct](#errordetails-struct)
    - [Example](#example)
    - [ErrorDetails Struct Fields](#errordetails-struct-fields)
    - [Example of Defined Errors](#example-of-defined-errors)
  - [Severity Levels](#severity-levels)
    - [Example of Using Severity Levels](#example-of-using-severity-levels)
  - [Methods](#methods)
    - [ErrorMessage()](#errormessage)
    - [ErrorCode()](#errorcode)
    - [ErrorSeverityLevel()](#errorseveritylevel)
    - [ErrorDetails()](#errordetails)
  - [Reflection](#reflection)
  - [Conclusion](#conclusion)

---

# GoTemplate
A template for a good start into new Go projects.

## Things to do after getting GoTemplate
<details>
  <summary><b>Linux/MacOS</b></summary>

  1. Give rights to execute sh files.
  ``` shell
  chmod +x initialize.sh build.sh
  ```
  2. Prepare the project. Ensure the files located in right directory (Project name)
  3. Initialize the project
  > NOTE: 
  > The initialize.sh has a parameter "-dg" for deleteing the git connection and the gitignore file. 
  ``` shell
  ./initialize.sh -dg   # initializes and deletes .git
  # or
  ./initialize.sh       # just initializes
  ``` 
  4. Build project for test purposes
  ``` shell
  ./build.sh
  ```
</details>

<details>
  <summary><b>Windows</b></summary>

  1. Prepare the project. Ensure the files located in right directory (Project name)
  2. Initialize the project
  > NOTE: 
  > The initialize.sh has a parameter "-dg" for deleteing the git connection and the gitignore file. 
  ``` cmd
  REM initializes and deletes .git
  initialize.bat -dg
  REM or
  REM just initializes
  initialize.bat 
  ``` 
  3. Build project for test purposes
  ``` cmd
  build.bat
  ```
</details>

</br>

---

</br>

# Build
Build is simple. Just execute following:

**Linux:**
```
./build.sh
```

**Windows:**
```
build.bat
```

**Results in following directory structure:**
```
├── build
│   ├── Windows
|   |   ├── x86
|   |   |   └──ProjectName.exe
|   |   └── x64
|   |       └──ProjectName.exe
│   ├── Linux
|   |   ├── x86
|   |   |   └──ProjectName
|   |   └── x64
|   |       └──ProjectName
│   └── MacOS/ProjectName
|       └── x64
|           └──ProjectName
```

</br>

---

</br>

# errorhandling package template

This Go package provides a simple error handling mechanism using custom error details, including error codes, messages, and severity levels. The package defines error types, associated methods, and utilities for working with error details in a structured way.

## Overview

The `errorhandling` package defines the `ErrorDetails` struct, which contains fields for an error code, message, and severity level. The severity level is represented using a custom type, `SeverityLevel`, which can be one of several predefined values.

### Features:
- Define custom errors with error codes, messages, and severity.
- Easily generate error descriptions using reflection.
- Methods to retrieve error code, message, and severity.
  
## Installation

To use this package, you can import it into your Go project as follows:

```go
import "path/to/your/repository/errorhandling"
```
For main.go just execute:
```
./initialize.sh
```
or
```
initialize.bat
```

## ErrorDetails Struct

The core of the package is the `ErrorDetails` struct. It represents an error with a code, message, and severity level.

### Example:

```go
package main

import (
	"fmt"
	"GoTemplate/errorhandling"  // Import the errorhandling package
)

func main() {
	// Create a new error instance
	err := errorhandling.ErrGeneral

	// Print error details
	fmt.Println(err.ErrorDetails())   // Print all details of the error
	fmt.Println(err.ErrorMessage())   // Get the error message
	fmt.Println(err.ErrorCode())      // Get the error code in hexadecimal format
	fmt.Println(err.ErrorSeverityLevel())  // Get the error severity level
}
```

### `ErrorDetails` Struct Fields

- **Code**: An integer representing the error code.
- **Message**: A string describing the error.
- **Severity**: A string representing the severity level of the error.

### Example of Defined Errors:

The package includes predefined error instances:

```go
var (
	Success = ErrorDetails{
		Code:     0x0001,
		Message:  "Success. No errors occurred.",
		Severity: Severity.None,
	}

	ErrGeneral = ErrorDetails{
		Code:     0x0002,
		Message:  "General error occurred",
		Severity: Severity.Low,
	}
)
```

## Severity Levels

The `SeverityLevel` type defines various severity levels for errors. These levels can be used to categorize the seriousness of the error.

```go
var Severity = struct {
	None     SeverityLevel
	Low      SeverityLevel
	Medium   SeverityLevel
	High     SeverityLevel
	Critical SeverityLevel
}{
	None:     "None",
	Low:      "Low",
	Medium:   "Medium",
	High:     "High",
	Critical: "Critical",
}
```

- **None**: No error (success).
- **Low**: A minor error or warning.
- **Medium**: A moderate error that may require attention.
- **High**: A serious error that needs prompt resolution.
- **Critical**: A critical error that requires immediate attention.

### Example of Using Severity Levels:

```go
package main

import (
	"fmt"
	"GoTemplate/errorhandling"
)

func main() {
	// Create a critical error
	criticalError := errorhandling.ErrorDetails{
		Code:     0x0003,
		Message:  "Critical system failure",
		Severity: errorhandling.Severity.Critical,
	}

	// Print error details
	fmt.Println(criticalError.ErrorDetails())   // Full error details
	fmt.Println(criticalError.ErrorMessage())   // "Critical system failure"
	fmt.Println(criticalError.ErrorCode())      // "0x0003"
	fmt.Println(criticalError.ErrorSeverityLevel()) // "Critical"
}
```

## Methods

### `ErrorMessage() string`

Returns the error message.

```go
func (e ErrorDetails) ErrorMessage() string
```

### `ErrorCode() string`

Returns the error code in hexadecimal format (e.g., `0x0002`).

```go
func (e ErrorDetails) ErrorCode() string
```

### `ErrorSeverityLevel() string`

Returns the severity level as a string.

```go
func (e ErrorDetails) ErrorSeverityLevel() string
```

### `ErrorDetails() string`

Generates a detailed error string with all the error fields (`Code`, `Message`, and `Severity`), which can be useful for logging or debugging.

```go
func (e ErrorDetails) ErrorDetails() string
```

### Example:

```go
package main

import (
	"fmt"
	"GoTemplate/errorhandling"
)

func main() {
	// Create a new error instance
	err := errorhandling.ErrGeneral

	// Output all error details
	fmt.Println("Error Details:")
	fmt.Println(err.ErrorDetails())

	// Output error code
	fmt.Println("Error Code:", err.ErrorCode())

	// Output error message
	fmt.Println("Error Message:", err.ErrorMessage())

	// Output error severity
	fmt.Println("Error Severity:", err.ErrorSeverityLevel())
}
```

## Reflection

The `ErrorDetails` struct also utilizes reflection to automatically generate error details. This allows you to easily iterate over all fields of the struct and print their names and values, including the custom fields like `Code`, `Message`, and `Severity`.

Example of using reflection in the `ErrorDetails` struct:

```go
package main

import (
	"fmt"
	"reflect"
	"GoTemplate/errorhandling"
)

func main() {
	// Create a new error instance
	err := errorhandling.ErrGeneral

	// Use reflection to print all error details
	val := reflect.ValueOf(err)
	for i := 0; i < val.NumField(); i++ {
		field := val.Type().Field(i)
		value := val.Field(i)

		// Format the output for the Code field
		if field.Name == "Code" {
			fmt.Printf("%s: 0x%04X\n", field.Name, value.Interface())
		} else {
			// Print other fields
			fmt.Printf("%s: %v\n", field.Name, value.Interface())
		}
	}
}
```

## Conclusion

This package provides a simple but flexible error handling mechanism in Go, allowing you to define custom errors with associated severity levels, messages, and codes. The utility functions and methods make it easy to generate detailed error descriptions and handle errors in a structured way.

Feel free to extend the `ErrorDetails` struct with more fields or create additional predefined errors as needed. This package is designed to be lightweight and easy to integrate into any Go application.
