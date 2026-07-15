extends Node

# How long each weather cycle lasts
@export var cycle_time: float = 60.0

# Current countdown value
var timer: float = 0.0

var current_cycle: int = 0

var weather_cycle: Array[String] = [
	"Clear",
	"Rain",
	"Drought",
	"Wind",
	"Cold"
]

var current_weather: String = ""

var game_finished: bool = false


func _ready() -> void:
	# Init timer at 60 seconds
	timer = cycle_time

	# Set the first weather to Clear
	current_weather = weather_cycle[current_cycle]

	print("Cycle started: ", current_cycle + 1)
	print("Current weather: ", current_weather)
	
func _process(delta: float) -> void:
	if game_finished:
		return

	timer -= delta

	# When the timer reaches zero, move to the next cycle
	if timer <= 0.0:
		timer = 0.0
		next_cycle()


func next_cycle() -> void:
	#WIN LOSE CONDITION
	# if not has_met_cycle_goal():
	#     lose_game()
	#     return

	current_cycle += 1

	if current_cycle >= weather_cycle.size():
		#win_game()
		return

	# Reset the timer for the next cycle
	timer = cycle_time

	current_weather = weather_cycle[current_cycle]

	print("Cycle started: ", current_cycle + 1)
	print("Current weather: ", current_weather)
	
