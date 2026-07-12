extends Node

var current_weather: String = "Clear"
var next_weather: String = "Clear"

var weather_options = [
	"Clear",
	"Rain",
	"Drought",
	"Wind",
	"Cold",
	"Predator Raid"
]

func _ready():
	roll_next_weather(1)

func roll_next_weather(day: int):
	current_weather = next_weather
	next_weather = weather_options.pick_random()

	print("Current Weather: ", current_weather)
	print("Tomorrow's Weather: ", next_weather)
	
func apply_current_weather(resource_manager):
	if current_weather == "Clear":
		print("Clear weather. No effect.")

	elif current_weather == "Rain":
		print("Rain: lose 2 sticks.")
		resource_manager.remove_sticks(2)

	elif current_weather == "Drought":
		print("Drought: lose 2 food.")
		resource_manager.remove_food(2)

	elif current_weather == "Wind":
		print("Wind: lose 1 silk and 1 stick.")
		resource_manager.remove_silk(1)
		resource_manager.remove_sticks(1)

	elif current_weather == "Cold":
		print("Cold: extra food required.")
		resource_manager.remove_food(3)

	elif current_weather == "Predator Raid":
		print("Predator Raid: lose 1 citizen.")
		resource_manager.remove_citizens(1)
