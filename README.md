# GoTemplate
A template for a good start into new Go projects.

## Things to do after cloning
<details>
  <summary><b>Linux/MacOS</b></summary>

  1. Give rights to execute sh files.
  ``` shell
  chmod +x initialize.sh build.sh
  ```
  2. Prepare the project. Ensure the files located in right directory (Project name)
  3. Initialize the project
  > NOTE
  > The initialize.sh has a parameter "-dg" for delete git. Use this parameter to disconnect from GoTemplates git.
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
  > NOTE
  > The initialize.sh has a parameter "-dg" for delete git. Use this parameter to disconnect from GoTemplates git.
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

# errorhandling package template
The errorhandling package provides a standardized way to handle errors using an extendable set of error codes and corresponding messages. It defines a Result type that can be used to represent various error states within your Go application.

This package allows you to easily extend the set of error codes by adding new constants, and also to define custom error messages for those error codes.

## Overview
The Result type is an integer that represents different states in your application. Each Result value is associated with a constant that indicates a specific error state. Additionally, the String() method for the Result type allows you to retrieve a human-readable error message associated with each error code.

## Core Components
### 1. Result Type
The Result type is a custom type based on an int. This type is used to represent different error states throughout your application.

``` go
type Result int
```
### 2. Error Constants
The package defines a set of constants that represent various error states. These constants can be expanded as needed to add new error codes.

``` go
const (
    Success    Result = 0x0000  // Indicates successful execution
    ErrGeneral Result = 0x0001  // General error that occurred
)
```
You can add additional error constants as required by your application, such as ErrNetwork, ErrFileNotFound, etc.

### 3. String Method
The String() method is used to return a human-readable error message corresponding to a given Result value. The method uses a switch statement to map each Result to a predefined message.

``` go
func (r Result) String() string {
    switch r {
    case Success:
        return "Success"
    case ErrGeneral:
        return "ErrGeneral"
    default:
        return "Unknown error occurred"
    }
}
```
The String() method can be used to easily print out the error message associated with a Result. If a new Result value is added, the switch statement should be updated to handle the new error code and return the appropriate message.

### 4. Extendability
The design of this package is flexible and extendable. Developers can add new error constants and update the String() method to handle the new error codes. For example:

``` go
const (
    ErrNetwork  Result = 0x0002  // Error indicating a network issue
    ErrTimeout  Result = 0x0003  // Error indicating a timeout
)

func (r Result) String() string {
    switch r {
    case Success:
        return "Success"
    case ErrGeneral:
        return "ErrGeneral"
    case ErrNetwork:
        return "Network Error"
    case ErrTimeout:
        return "Timeout Error"
    default:
        return "Unknown error occurred"
    }
}
```
This allows for easy expansion of the error-handling capabilities as your application grows.

## Usage
### 1. Initializing Result
In your Go files (such as main.go), you can start by initializing a Result variable to represent the current state of the application. You can use predefined constants like Success or ErrGeneral to indicate the status of an operation.

Example:

``` go
result := errorhandling.Success  // Indicating successful execution
// or
result := errorhandling.ErrGeneral  // Indicating a general error
```
### 2. Setting Error States
As the application progresses, you can change the value of the Result variable to reflect different error states. For example, if a network request fails, you can set:

go
Code kopieren
result = errorhandling.ErrNetwork
### 3. Displaying Error Messages
When you want to display the error message associated with the Result value, you can use the String() method in combination with standard formatting functions like fmt.Printf to print the error message.

#### Example:

``` go
fmt.Printf("Error: %s\n", result)  // Prints the string representation of the error
```

If result is set to errorhandling.ErrGeneral, the output will be:

```
Error: ErrGeneral
```
### 4. Combining Error Handling with Application Logic
This pattern allows you to handle errors at specific points in your code and provide meaningful error messages. By using the Result type, you can ensure consistent error handling throughout your application.

Example:

``` go
func someFunction() Result {
    // Simulate an error condition
    return errorhandling.ErrNetwork
}

func main() {
    result := someFunction()
    fmt.Printf("Operation result: %s\n", result)  // Output: Operation result: Network Error
}
```
Benefits of This Approach
Centralized Error Management: All error codes and messages are defined in one place, making it easy to maintain and expand.
Extendability: You can easily add new error codes and their corresponding messages without affecting the rest of the application.
Consistency: Using the Result type across your application ensures consistent error handling and simplifies debugging.
Readability: The String() method provides clear, human-readable error messages that can be printed or logged.
