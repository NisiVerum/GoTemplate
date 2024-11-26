package errorhandling

// Error constants
type Result int

const (
	Success    Result = 0x0000
	ErrGeneral Result = 0x0001
)

// Error Messages
func (r Result) String() string {
	switch r {
	case Success:
		return "Success"
	case ErrGeneral:
		return "ErrGeneral"
	default:
		return "Unknown error occured"
	}
}
