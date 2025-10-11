// Package weather forecast package that does weather forecast things.
package weather

// CurrentCondition stores the current condition.
var CurrentCondition string
// CurrentLocation stores the current location.
var CurrentLocation string

// Forecast the forecast.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
