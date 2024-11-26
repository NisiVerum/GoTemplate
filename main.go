package main

import (
	"GoTemplate/errorhandling"
	"fmt"
	"time"
)

func main() {
	// Start time for time measurement
	startTime := time.Now()
	result := errorhandling.Success

	// Code here...
	fmt.Println("Hello World!")

	// End time for time measurement
	durationTime := time.Since(startTime)

	fmt.Printf("%s, Finished in %v\n", result, durationTime)
}