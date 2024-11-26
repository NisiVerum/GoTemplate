package errorhandling

import(
	"fmt"
	"reflect"
)

type ErrorDetails struct {
	Code    	int
	Message 	string
	Severity	SeverityLevel
}

type SeverityLevel string

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

// Append this with your error information
var (
	Success = ErrorDetails {
		Code:		0x0001,
		Message:	"Success. No errors occured.",
		Severity:	Severity.None,
	}
	ErrGeneral = ErrorDetails {
		Code:		0x0002,
		Message:	"General error occured",
		Severity:	Severity.Low,
	}
)

// Gets error message
func (e ErrorDetails) ErrorMessage() string {
    return e.Message
}

// Gets error code
func (e ErrorDetails) ErrorCode() string {
	return fmt.Sprintf("0x%04X", e.Code)
}

// Gets error severity
func (e ErrorDetails) ErrorSeverityLevel() string {
	return string(e.Severity)
}

func (e ErrorDetails) ErrorDetails() string {
	var result string

	// reflection to iterate through all fields
	val := reflect.ValueOf(e)

	// Check if its a struct
	if val.Kind() == reflect.Struct {
		for i := 0; i < val.NumField(); i++ {
			field := val.Type().Field(i)
			value := val.Field(i)

			// Error code in following format "0x0000"
			if field.Name == "Code" {
				result += fmt.Sprintf("%s: 0x%04X\n", field.Name, value.Interface())
			} else {
				// All other fields
				result += fmt.Sprintf("%s: %v\n", field.Name, value.Interface())
			}
		}
	}

	return result
}