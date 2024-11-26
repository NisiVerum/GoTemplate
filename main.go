package main

import (
	"GoTemplate/errorhandling"
	"fmt"
	"time"
	"strings"
)

func main() {
	// Start time for time measurement
	startTime := time.Now()
	result := errorhandling.Success

	// --> Your code here...
	fmt.Println("Hello World!")

	// End time for time measurement
	durationTime := time.Since(startTime)

	fmt.Printf("\n%s: %s, Finished in %v\n", result.ErrorCode(), result.ErrorMessage(), durationTime)
	if result != errorhandling.Success {
		line := strings.Repeat("-", 5)
		fmt.Printf("\n%s Error information %s\n%s\n", line, line, result.ErrorDetails())
	}
}