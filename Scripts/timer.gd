extends Timer

@export var secondsPerCycle = 10
@export var cyclesPerWeather = 6

var cycle = 0

signal cycle_passed
signal weather_passed

func _ready() -> void:
	wait_time = secondsPerCycle
	
func _on_timeout() -> void:
	cycle += 1
	if cycle % cyclesPerWeather == 0:
		weather_passed.emit()
	else:
		cycle_passed.emit()
		
